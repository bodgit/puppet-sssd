require 'spec_helper'

describe 'sssd::domain' do
  let(:title) do
    'test'
  end

  let(:params) do
    {
      :enumerate                 => true,
      :cache_credentials         => true,
      :id_provider               => 'ldap',
      :auth_provider             => 'ldap',
      :ldap_schema               => 'rfc2307',
      :chpass_provider           => 'ldap',
      :ldap_uri                  => [
        'ldap://ldap1.example.com',
        'ldap://ldap2.example.com',
      ],
      :ldap_search_base          => 'dc=example,dc=com',
      :ldap_tls_reqcert          => 'demand',
      :ldap_id_use_start_tls     => true,
      :entry_cache_timeout       => 600,
      :ldap_network_timeout      => 3,
      :ldap_default_bind_dn      => 'cn=Manager,dc=example,dc=com',
      :ldap_default_authtok_type => 'password',
      :ldap_default_authtok      => 'secret',
      :ldap_sasl_maxssf          => 256,
    }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'without sssd class included' do
        it { is_expected.to compile.and_raise_error(%r{must include the sssd base class}) }
      end

      context 'with sssd class included' do
        let(:pre_condition) do
          'include ::sssd'
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_datacat_fragment('sssd domain test') }
        it { is_expected.to contain_sssd__domain('test') }
        it { is_expected.to contain_sssd_conf('domain/test/enumerate').with_value('true') }
        it { is_expected.to contain_sssd_conf('domain/test/cache_credentials').with_value('true') }
        it { is_expected.to contain_sssd_conf('domain/test/id_provider').with_value('ldap') }
        it { is_expected.to contain_sssd_conf('domain/test/auth_provider').with_value('ldap') }
        it { is_expected.to contain_sssd_conf('domain/test/cache_credentials').with_value('true') }
        it { is_expected.to contain_sssd_conf('domain/test/chpass_provider').with_value('ldap') }
        it { is_expected.to contain_sssd_conf('domain/test/entry_cache_timeout').with_value(600) }
        it { is_expected.to contain_sssd_conf('domain/test/ldap_default_authtok').with_value('secret') }
        it { is_expected.to contain_sssd_conf('domain/test/ldap_default_authtok_type').with_value('password') }
        it { is_expected.to contain_sssd_conf('domain/test/ldap_default_bind_dn').with_value('cn=Manager,dc=example,dc=com') }
        it { is_expected.to contain_sssd_conf('domain/test/ldap_id_use_start_tls').with_value('true') }
        it { is_expected.to contain_sssd_conf('domain/test/ldap_network_timeout').with_value(3) }
        it { is_expected.to contain_sssd_conf('domain/test/ldap_sasl_maxssf').with_value(256) }
        it { is_expected.to contain_sssd_conf('domain/test/ldap_schema').with_value('rfc2307') }
        it { is_expected.to contain_sssd_conf('domain/test/ldap_search_base').with_value('dc=example,dc=com') }
        it { is_expected.to contain_sssd_conf('domain/test/ldap_tls_reqcert').with_value('demand') }
        it { is_expected.to contain_sssd_conf('domain/test/ldap_uri').with_value('ldap://ldap1.example.com, ldap://ldap2.example.com') }
      end
    end
  end
end
