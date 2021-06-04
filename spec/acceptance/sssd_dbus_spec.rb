require 'spec_helper_acceptance'

describe 'sssd::dbus' do
  it 'works with no errors' do
    pp = <<-EOS
      include ::dbus
      include ::sssd
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
      include ::sssd::dbus
    EOS

    # If SSSD pulls in an updated D-Bus package it can take an extra run
    # to converge
    apply_manifest(pp, catch_failures: true)
    apply_manifest(pp, catch_failures: true)
    apply_manifest(pp, catch_changes:  true)
  end

  describe package('sssd-dbus') do
    it { is_expected.to be_installed }
  end

  describe file('/etc/dbus-1/system.d/org.freedesktop.sssd.infopipe.conf') do
    it { is_expected.to be_file }
    it { is_expected.to be_mode 644 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
    its(:content) { is_expected.to match(%r{busconfig}) }
  end

  describe command('dbus-send --system --dest=org.freedesktop.sssd.infopipe --print-reply /org/freedesktop/sssd/infopipe org.freedesktop.sssd.infopipe.ListDomains') do
    its(:exit_status) { is_expected.to eq 0 }
    its(:stdout) { is_expected.to match(%r{object path "/org/freedesktop/sssd/infopipe/Domains/example_2ecom"$}) }
  end
end
