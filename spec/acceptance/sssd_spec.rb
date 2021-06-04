require 'spec_helper_acceptance'

describe 'sssd' do
  it 'works with no errors' do
    pp = <<-EOS
      include ::openldap
      include ::openldap::client
      class { '::openldap::server':
        root_dn       => 'cn=Manager,dc=example,dc=com',
        root_password => 'secret',
        suffix        => 'dc=example,dc=com',
        access        => [
          [
            {
              'attrs' => ['userPassword'],
            },
            [
              {
                'who'    => ['self'],
                'access' => '=xw',
              },
              {
                'who'    => ['anonymous'],
                'access' => 'auth',
              },
            ],
          ],
          [
            {
              'dn' => '*',
            },
            [
              {
                'who'    => ['dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth"'],
                'access' => 'manage',
              },
              {
                'who'    => ['users'],
                'access' => 'read',
              },
            ],
          ],
        ],
      }

      ::openldap::server::schema { 'cosine':
        ensure => present,
      }
      ::openldap::server::schema { 'inetorgperson':
        ensure  => present,
        require => ::Openldap::Server::Schema['cosine'],
      }
      ::openldap::server::schema { 'nis':
        ensure  => present,
        require => ::Openldap::Server::Schema['inetorgperson'],
      }

      include ::sssd
      ::sssd::service { 'nss': }
      ::sssd::domain { 'example.com':
        id_provider               => 'ldap',
        ldap_schema               => 'rfc2307',
        ldap_uri                  => ['ldap://127.0.0.1'],
        ldap_search_base          => 'dc=example,dc=com',
        ldap_tls_reqcert          => 'never',
        ldap_id_use_start_tls     => false,
        ldap_default_bind_dn      => 'cn=Manager,dc=example,dc=com',
        ldap_default_authtok      => 'secret',
      }

      class { '::nsswitch':
        passwd => ['files', 'sss'],
        shadow => ['files', 'sss'],
        group  => ['files', 'sss'],
      }

      Class['::openldap'] -> Class['::sssd'] -> Class['::nsswitch']
    EOS

    apply_manifest(pp, catch_failures: true)
    apply_manifest(pp, catch_changes:  true)
  end

  describe command('ldapadd -Y EXTERNAL -H ldapi:/// -f /root/example.ldif') do
    its(:exit_status) { is_expected.to eq 0 }
  end

  describe package('sssd') do
    it { is_expected.to be_installed }
  end

  describe file('/etc/sssd') do
    it { is_expected.to be_directory }
    it { is_expected.to be_mode 711 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
  end

  describe file('/etc/sssd/sssd.conf') do
    it { is_expected.to be_file }
    it { is_expected.to be_mode 600 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
    its(:content) do
      is_expected.to match %r{^ \[ sssd \] $}x
      is_expected.to match %r{^ domains = example\.com $}x
      is_expected.to match %r{^ services = nss $}x if fact('operatingsystemmajrelease').eql?('6')
      is_expected.to match %r{^ services = $}x unless fact('operatingsystemmajrelease').eql?('6')
      is_expected.to match %r{^ \[ domain/example\.com \] $}x
    end
  end

  describe service('sssd') do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  describe service('sssd-nss.socket'), unless: fact('operatingsystemmajrelease').eql?('6') do
    it { is_expected.to be_enabled }
  end

  # There's some sort of negative/offline caching going on, bounce sssd
  describe command('service sssd restart') do
    its(:exit_status) { is_expected.to eq 0 }
  end

  describe user('alice') do
    it { is_expected.to exist }
    it { is_expected.to belong_to_primary_group 'alice' }
    it { is_expected.to have_uid 2000 }
    it { is_expected.to have_home_directory '/home/alice' }
    it { is_expected.to have_login_shell '/bin/bash' }
  end

  describe group('alice') do
    it { is_expected.to exist }
    it { is_expected.to have_gid 2000 }
  end
end
