require 'spec_helper_acceptance'

describe 'sssd' do

  it 'should work with no errors' do

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

    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes  => true)
  end

  describe command('ldapadd -Y EXTERNAL -H ldapi:/// -f /root/example.ldif') do
    its(:exit_status) { should eq 0 }
  end

  describe package('sssd') do
    it { should be_installed }
  end

  describe file('/etc/sssd') do
    it { should be_directory }
    it { should be_mode 711 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe file('/etc/sssd/sssd.conf') do
    it { should be_file }
    it { should be_mode 600 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should match %r{^ \[ sssd \] $}x }
    its(:content) { should match %r{^ domains = example\.com $}x }
    its(:content) { should match %r{^ services = nss $}x } if fact('operatingsystemmajrelease').eql?('6')
    its(:content) { should match %r{^ services = $}x } unless fact('operatingsystemmajrelease').eql?('6')
    its(:content) { should match %r{^ \[ domain/example\.com \] $}x }
  end

  describe service('sssd') do
    it { should be_enabled }
    it { should be_running }
  end

  describe service('sssd-nss.socket'), unless: fact('operatingsystemmajrelease').eql?('6') do
    it { should be_enabled }
  end

  # There's some sort of negative/offline caching going on, bounce sssd
  describe command('service sssd restart') do
    its(:exit_status) { should eq 0 }
  end

  describe user('alice') do
    it { should exist }
    it { should belong_to_primary_group 'alice' }
    it { should have_uid 2000 }
    it { should have_home_directory '/home/alice' }
    it { should have_login_shell '/bin/bash' }
  end

  describe group('alice') do
    it { should exist }
    it { should have_gid 2000 }
  end
end
