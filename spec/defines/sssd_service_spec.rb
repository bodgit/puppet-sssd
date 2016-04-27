require 'spec_helper'

describe 'sssd::service' do

  let(:params) do
    {
      :debug_level          => '0x77f0',
      :debug_timestamps     => true,
      :debug_microseconds   => true,
      :timeout              => 10,
      :reconnection_retries => 3,
      :fd_limit             => 8192,
      :client_idle_timeout  => 60,
      :force_timeout        => 60,
      :offline_timeout      => 60,
      :subdomain_inherit    => [
        'ignore_group_members',
        'ldap_purge_cache_timeout',
        'ldap_use_tokengroups',
        'ldap_user_principal',
      ],
    }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'without sssd class included' do
        let(:title) do
          'test'
        end

        it { expect { should compile }.to raise_error(/must include the sssd base class/) }
      end

      context 'with sssd class included' do
        let(:pre_condition) do
          'include ::sssd'
        end

        context 'invalid service' do
          let(:title) do
            'invalid'
          end

          it { expect { should compile }.to raise_error(/invalid sssd service is not supported/) }
        end

        context 'nss service', :compile do
          let(:title) do
            'nss'
          end

          let(:params) do
            super().merge(
              {
                :enum_cache_timeout            => 120,
                :entry_cache_nowait_percentage => 50,
                :entry_negative_timeout        => 15,
                :filter_groups                 => ['root'],
                :filter_users                  => ['root'],
                :filter_users_in_groups        => true,
                :override_homedir              => '/home/%u',
                :homedir_substring             => '/home',
                :fallback_homedir              => '/home/%u',
                :override_shell                => '/bin/sh',
                :allowed_shells                => ['/bin/bash', '/bin/zsh'],
                :vetoed_shells                 => ['/bin/csh'],
                :shell_fallback                => '/bin/sh',
                :default_shell                 => '/bin/bash',
                :get_domains_timeout           => 60,
                :memcache_timeout              => 300,
                :user_attributes               => ['+telephoneNumber'],
              }
            )
          end

          it { should contain_datacat_fragment('sssd service nss') }
          it { should contain_sssd__service('nss') }
          it { should contain_sssd_conf('nss/filter_users_in_groups').with_value('true') }
          it { should contain_sssd_conf('nss/allowed_shells').with_value('/bin/bash, /bin/zsh') }
          it { should contain_sssd_conf('nss/client_idle_timeout').with_value('60') }
          it { should contain_sssd_conf('nss/debug_level').with_value('0x77f0') }
          it { should contain_sssd_conf('nss/debug_microseconds').with_value('true') }
          it { should contain_sssd_conf('nss/debug_timestamps').with_value('true') }
          it { should contain_sssd_conf('nss/default_shell').with_value('/bin/bash') }
          it { should contain_sssd_conf('nss/entry_cache_nowait_percentage').with_value('50') }
          it { should contain_sssd_conf('nss/entry_negative_timeout').with_value('15') }
          it { should contain_sssd_conf('nss/enum_cache_timeout').with_value('120') }
          it { should contain_sssd_conf('nss/fallback_homedir').with_value('/home/%u') }
          it { should contain_sssd_conf('nss/fd_limit').with_value('8192') }
          it { should contain_sssd_conf('nss/filter_groups').with_value('root') }
          it { should contain_sssd_conf('nss/filter_users').with_value('root') }
          it { should contain_sssd_conf('nss/force_timeout').with_value('60') }
          it { should contain_sssd_conf('nss/get_domains_timeout').with_value('60') }
          it { should contain_sssd_conf('nss/homedir_substring').with_value('/home') }
          it { should contain_sssd_conf('nss/memcache_timeout').with_value('300') }
          it { should contain_sssd_conf('nss/offline_timeout').with_value('60') }
          it { should contain_sssd_conf('nss/override_homedir').with_value('/home/%u') }
          it { should contain_sssd_conf('nss/override_shell').with_value('/bin/sh') }
          it { should contain_sssd_conf('nss/reconnection_retries').with_value('3') }
          it { should contain_sssd_conf('nss/shell_fallback').with_value('/bin/sh') }
          it { should contain_sssd_conf('nss/subdomain_inherit').with_value('ignore_group_members, ldap_purge_cache_timeout, ldap_use_tokengroups, ldap_user_principal') }
          it { should contain_sssd_conf('nss/timeout').with_value('10') }
          it { should contain_sssd_conf('nss/user_attributes').with_value('+telephoneNumber') }
          it { should contain_sssd_conf('nss/vetoed_shells').with_value('/bin/csh') }
        end

        context 'pam service', :compile do
          let(:title) do
            'pam'
          end

          let(:params) do
            super().merge(
              {
                :offline_credentials_expiration => 0,
                :offline_failed_login_attempts  => 0,
                :offline_failed_login_delay     => 5,
                :pam_verbosity                  => 1,
                :pam_id_timeout                 => 5,
                :pam_pwd_expiration_warning     => 0,
                :get_domains_timeout            => 60,
                :pam_trusted_users              => [0],
                :pam_public_domains             => ['none'],
                :pam_account_expired_message    => 'Account expired, please call help desk.',
              }
            )
          end

          it { should contain_datacat_fragment('sssd service pam') }
          it { should contain_sssd__service('pam') }
          it { should contain_sssd_conf('pam/client_idle_timeout').with_value('60') }
          it { should contain_sssd_conf('pam/debug_level').with_value('0x77f0') }
          it { should contain_sssd_conf('pam/debug_microseconds').with_value('true') }
          it { should contain_sssd_conf('pam/debug_timestamps').with_value('true') }
          it { should contain_sssd_conf('pam/fd_limit').with_value('8192') }
          it { should contain_sssd_conf('pam/force_timeout').with_value('60') }
          it { should contain_sssd_conf('pam/get_domains_timeout').with_value('60') }
          it { should contain_sssd_conf('pam/offline_credentials_expiration').with_value('0') }
          it { should contain_sssd_conf('pam/offline_failed_login_attempts').with_value('0') }
          it { should contain_sssd_conf('pam/offline_failed_login_delay').with_value('5') }
          it { should contain_sssd_conf('pam/offline_timeout').with_value('60') }
          it { should contain_sssd_conf('pam/pam_account_expired_message').with_value('Account expired, please call help desk.') }
          it { should contain_sssd_conf('pam/pam_id_timeout').with_value('5') }
          it { should contain_sssd_conf('pam/pam_public_domains').with_value('none') }
          it { should contain_sssd_conf('pam/pam_pwd_expiration_warning').with_value('0') }
          it { should contain_sssd_conf('pam/pam_trusted_users').with_value('0') }
          it { should contain_sssd_conf('pam/pam_verbosity').with_value('1') }
          it { should contain_sssd_conf('pam/reconnection_retries').with_value('3') }
          it { should contain_sssd_conf('pam/subdomain_inherit').with_value('ignore_group_members, ldap_purge_cache_timeout, ldap_use_tokengroups, ldap_user_principal') }
          it { should contain_sssd_conf('pam/timeout').with_value('10') }
        end

        context 'sudo service', :compile do
          let(:title) do
            'sudo'
          end

          let(:params) do
            super().merge(
              {
                :sudo_timed => false,
              }
            )
          end

          it { should contain_datacat_fragment('sssd service sudo') }
          it { should contain_sssd__service('sudo') }
          it { should contain_sssd_conf('sudo/client_idle_timeout').with_value('60') }
          it { should contain_sssd_conf('sudo/debug_level').with_value('0x77f0') }
          it { should contain_sssd_conf('sudo/debug_microseconds').with_value('true') }
          it { should contain_sssd_conf('sudo/debug_timestamps').with_value('true') }
          it { should contain_sssd_conf('sudo/fd_limit').with_value('8192') }
          it { should contain_sssd_conf('sudo/force_timeout').with_value('60') }
          it { should contain_sssd_conf('sudo/offline_timeout').with_value('60') }
          it { should contain_sssd_conf('sudo/reconnection_retries').with_value('3') }
          it { should contain_sssd_conf('sudo/subdomain_inherit').with_value('ignore_group_members, ldap_purge_cache_timeout, ldap_use_tokengroups, ldap_user_principal') }
          it { should contain_sssd_conf('sudo/sudo_timed').with_value('false') }
          it { should contain_sssd_conf('sudo/timeout').with_value('10') }
        end

        context 'autofs service', :compile do
          let(:title) do
            'autofs'
          end

          let(:params) do
            super().merge(
              {
                :autofs_negative_timeout => 15,
              }
            )
          end

          it { should contain_datacat_fragment('sssd service autofs') }
          it { should contain_sssd__service('autofs') }
          it { should contain_sssd_conf('autofs/autofs_negative_timeout').with_value('15') }
          it { should contain_sssd_conf('autofs/client_idle_timeout').with_value('60') }
          it { should contain_sssd_conf('autofs/debug_level').with_value('0x77f0') }
          it { should contain_sssd_conf('autofs/debug_microseconds').with_value('true') }
          it { should contain_sssd_conf('autofs/debug_timestamps').with_value('true') }
          it { should contain_sssd_conf('autofs/fd_limit').with_value('8192') }
          it { should contain_sssd_conf('autofs/force_timeout').with_value('60') }
          it { should contain_sssd_conf('autofs/offline_timeout').with_value('60') }
          it { should contain_sssd_conf('autofs/reconnection_retries').with_value('3') }
          it { should contain_sssd_conf('autofs/subdomain_inherit').with_value('ignore_group_members, ldap_purge_cache_timeout, ldap_use_tokengroups, ldap_user_principal') }
          it { should contain_sssd_conf('autofs/timeout').with_value('10') }
        end

        context 'ssh service', :compile do
          let(:title) do
            'ssh'
          end

          let(:params) do
            super().merge(
              {
                :ssh_hash_known_hosts    => true,
                :ssh_known_hosts_timeout => 180,
                :ca_db                   => '/etc/pki/nssdb',
              }
            )
          end

          it { should contain_datacat_fragment('sssd service ssh') }
          it { should contain_sssd__service('ssh') }
          it { should contain_sssd_conf('ssh/ca_db').with_value('/etc/pki/nssdb') }
          it { should contain_sssd_conf('ssh/client_idle_timeout').with_value('60') }
          it { should contain_sssd_conf('ssh/debug_level').with_value('0x77f0') }
          it { should contain_sssd_conf('ssh/debug_microseconds').with_value('true') }
          it { should contain_sssd_conf('ssh/debug_timestamps').with_value('true') }
          it { should contain_sssd_conf('ssh/fd_limit').with_value('8192') }
          it { should contain_sssd_conf('ssh/force_timeout').with_value('60') }
          it { should contain_sssd_conf('ssh/offline_timeout').with_value('60') }
          it { should contain_sssd_conf('ssh/reconnection_retries').with_value('3') }
          it { should contain_sssd_conf('ssh/ssh_hash_known_hosts').with_value('true') }
          it { should contain_sssd_conf('ssh/ssh_known_hosts_timeout').with_value('180') }
          it { should contain_sssd_conf('ssh/subdomain_inherit').with_value('ignore_group_members, ldap_purge_cache_timeout, ldap_use_tokengroups, ldap_user_principal') }
          it { should contain_sssd_conf('ssh/timeout').with_value('10') }
        end

        context 'pac service', :compile do
          let(:title) do
            'pac'
          end

          let(:params) do
            super().merge(
              {
                :allowed_uids => [0],
              }
            )
          end

          it { should contain_datacat_fragment('sssd service pac') }
          it { should contain_sssd__service('pac') }
          it { should contain_sssd_conf('pac/allowed_uids').with_value('0') }
          it { should contain_sssd_conf('pac/client_idle_timeout').with_value('60') }
          it { should contain_sssd_conf('pac/debug_level').with_value('0x77f0') }
          it { should contain_sssd_conf('pac/debug_microseconds').with_value('true') }
          it { should contain_sssd_conf('pac/debug_timestamps').with_value('true') }
          it { should contain_sssd_conf('pac/fd_limit').with_value('8192') }
          it { should contain_sssd_conf('pac/force_timeout').with_value('60') }
          it { should contain_sssd_conf('pac/offline_timeout').with_value('60') }
          it { should contain_sssd_conf('pac/reconnection_retries').with_value('3') }
          it { should contain_sssd_conf('pac/subdomain_inherit').with_value('ignore_group_members, ldap_purge_cache_timeout, ldap_use_tokengroups, ldap_user_principal') }
          it { should contain_sssd_conf('pac/timeout').with_value('10') }
        end

        context 'ifp service', :compile do
          let(:title) do
            'ifp'
          end

          let(:params) do
            super().merge(
              {
                :allowed_uids    => [0],
                :user_attributes => ['+telephoneNumber'],
                :wildcard_limit  => 1000,
              }
            )
          end

          it { should contain_datacat_fragment('sssd service ifp') }
          it { should contain_sssd__service('ifp') }
          it { should contain_sssd_conf('ifp/allowed_uids').with_value('0') }
          it { should contain_sssd_conf('ifp/client_idle_timeout').with_value('60') }
          it { should contain_sssd_conf('ifp/debug_level').with_value('0x77f0') }
          it { should contain_sssd_conf('ifp/debug_microseconds').with_value('true') }
          it { should contain_sssd_conf('ifp/debug_timestamps').with_value('true') }
          it { should contain_sssd_conf('ifp/fd_limit').with_value('8192') }
          it { should contain_sssd_conf('ifp/force_timeout').with_value('60') }
          it { should contain_sssd_conf('ifp/offline_timeout').with_value('60') }
          it { should contain_sssd_conf('ifp/reconnection_retries').with_value('3') }
          it { should contain_sssd_conf('ifp/subdomain_inherit').with_value('ignore_group_members, ldap_purge_cache_timeout, ldap_use_tokengroups, ldap_user_principal') }
          it { should contain_sssd_conf('ifp/timeout').with_value('10') }
          it { should contain_sssd_conf('ifp/user_attributes').with_value('+telephoneNumber') }
          it { should contain_sssd_conf('ifp/wildcard_limit').with_value('1000') }
        end
      end
    end
  end
end
