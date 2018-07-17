require 'spec_helper'

describe 'sssd::service' do

  let(:params) do
    {
      :debug                  => 0x77f0,
      :debug_level            => 0x77f0,
      :debug_timestamps       => true,
      :debug_microseconds     => true,
      :timeout                => 10,
      :reconnection_retries   => 3,
      :fd_limit               => 8192,
      :client_idle_timeout    => 60,
      :offline_timeout        => 60,
      :responder_idle_timeout => 300,
      :cache_first            => false,
    }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'without sssd class included' do
        let(:title) do
          'nss'
        end

        it { is_expected.to compile.and_raise_error(%r{Unknown variable}) }
      end

      context 'with sssd class included' do
        let(:pre_condition) do
          'include ::sssd'
        end

        context 'invalid service' do
          let(:title) do
            'invalid'
          end

          it { is_expected.to compile.and_raise_error(%r{got 'invalid'}) }
        end

        context 'nss service' do
          let(:title) do
            'nss'
          end

          let(:params) do
            super().merge(
              {
                :enum_cache_timeout            => 120,
                :entry_cache_nowait_percentage => 50,
                :entry_negative_timeout        => 15,
                :local_negative_timeout        => 0,
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
                :pwfield                       => '*',
              }
            )
          end

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_sssd__service('nss') }
          it { is_expected.to contain_sssd_conf('nss/filter_users_in_groups').with_value('true') }
          it { is_expected.to contain_sssd_conf('nss/allowed_shells').with_value('/bin/bash, /bin/zsh') }
          it { is_expected.to contain_sssd_conf('nss/cache_first').with_value(false) }
          it { is_expected.to contain_sssd_conf('nss/client_idle_timeout').with_value('60') }
          it { is_expected.to contain_sssd_conf('nss/debug').with_value(30704) }
          it { is_expected.to contain_sssd_conf('nss/debug_level').with_value(30704) }
          it { is_expected.to contain_sssd_conf('nss/debug_microseconds').with_value('true') }
          it { is_expected.to contain_sssd_conf('nss/debug_timestamps').with_value('true') }
          it { is_expected.to contain_sssd_conf('nss/default_shell').with_value('/bin/bash') }
          it { is_expected.to contain_sssd_conf('nss/entry_cache_nowait_percentage').with_value('50') }
          it { is_expected.to contain_sssd_conf('nss/entry_negative_timeout').with_value('15') }
          it { is_expected.to contain_sssd_conf('nss/enum_cache_timeout').with_value('120') }
          it { is_expected.to contain_sssd_conf('nss/fallback_homedir').with_value('/home/%u') }
          it { is_expected.to contain_sssd_conf('nss/fd_limit').with_value('8192') }
          it { is_expected.to contain_sssd_conf('nss/filter_groups').with_value('root') }
          it { is_expected.to contain_sssd_conf('nss/filter_users').with_value('root') }
          it { is_expected.to contain_sssd_conf('nss/get_domains_timeout').with_value('60') }
          it { is_expected.to contain_sssd_conf('nss/homedir_substring').with_value('/home') }
          it { is_expected.to contain_sssd_conf('nss/local_negative_timeout').with_value('0') }
          it { is_expected.to contain_sssd_conf('nss/memcache_timeout').with_value('300') }
          it { is_expected.to contain_sssd_conf('nss/offline_timeout').with_value('60') }
          it { is_expected.to contain_sssd_conf('nss/override_homedir').with_value('/home/%u') }
          it { is_expected.to contain_sssd_conf('nss/override_shell').with_value('/bin/sh') }
          it { is_expected.to contain_sssd_conf('nss/pwfield').with_value('*') }
          it { is_expected.to contain_sssd_conf('nss/reconnection_retries').with_value('3') }
          it { is_expected.to contain_sssd_conf('nss/responder_idle_timeout').with_value('300') }
          it { is_expected.to contain_sssd_conf('nss/shell_fallback').with_value('/bin/sh') }
          it { is_expected.to contain_sssd_conf('nss/timeout').with_value('10') }
          it { is_expected.to contain_sssd_conf('nss/user_attributes').with_value('+telephoneNumber') }
          it { is_expected.to contain_sssd_conf('nss/vetoed_shells').with_value('/bin/csh') }

          case facts[:operatingsystemmajrelease]
          when '6'
            it { is_expected.to contain_datacat_fragment('sssd service nss') }
          else
            it { is_expected.to contain_service('sssd-nss.socket').with_enable(true) }
            it { is_expected.to have_datacat_fragment_resource_count(0) }
          end
        end

        context 'pam service' do
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
                :pam_response_filter            => ['ENV'],
                :pam_id_timeout                 => 5,
                :pam_pwd_expiration_warning     => 0,
                :get_domains_timeout            => 60,
                :pam_trusted_users              => [0],
                :pam_public_domains             => ['none'],
                :pam_account_expired_message    => 'Account expired, please call help desk.',
                :pam_account_locked_message     => 'Account locked, please contact help desk.',
                :pam_cert_auth                  => false,
                :pam_cert_db_path               => '/etc/pki/nssdb',
                :p11_child_timeout              => 10,
                :pam_app_services               => ['test'],
              }
            )
          end

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_sssd__service('pam') }
          it { is_expected.to contain_sssd_conf('pam/cache_first').with_value(false) }
          it { is_expected.to contain_sssd_conf('pam/client_idle_timeout').with_value('60') }
          it { is_expected.to contain_sssd_conf('pam/debug').with_value(30704) }
          it { is_expected.to contain_sssd_conf('pam/debug_level').with_value(30704) }
          it { is_expected.to contain_sssd_conf('pam/debug_microseconds').with_value('true') }
          it { is_expected.to contain_sssd_conf('pam/debug_timestamps').with_value('true') }
          it { is_expected.to contain_sssd_conf('pam/fd_limit').with_value('8192') }
          it { is_expected.to contain_sssd_conf('pam/get_domains_timeout').with_value('60') }
          it { is_expected.to contain_sssd_conf('pam/offline_credentials_expiration').with_value('0') }
          it { is_expected.to contain_sssd_conf('pam/offline_failed_login_attempts').with_value('0') }
          it { is_expected.to contain_sssd_conf('pam/offline_failed_login_delay').with_value('5') }
          it { is_expected.to contain_sssd_conf('pam/offline_timeout').with_value('60') }
          it { is_expected.to contain_sssd_conf('pam/p11_child_timeout').with_value('10') }
          it { is_expected.to contain_sssd_conf('pam/pam_account_expired_message').with_value('Account expired, please call help desk.') }
          it { is_expected.to contain_sssd_conf('pam/pam_account_locked_message').with_value('Account locked, please contact help desk.') }
          it { is_expected.to contain_sssd_conf('pam/pam_app_services').with_value('test') }
          it { is_expected.to contain_sssd_conf('pam/pam_cert_auth').with_value(false) }
          it { is_expected.to contain_sssd_conf('pam/pam_cert_db_path').with_value('/etc/pki/nssdb') }
          it { is_expected.to contain_sssd_conf('pam/pam_id_timeout').with_value('5') }
          it { is_expected.to contain_sssd_conf('pam/pam_public_domains').with_value('none') }
          it { is_expected.to contain_sssd_conf('pam/pam_pwd_expiration_warning').with_value('0') }
          it { is_expected.to contain_sssd_conf('pam/pam_trusted_users').with_value('0') }
          it { is_expected.to contain_sssd_conf('pam/pam_verbosity').with_value('1') }
          it { is_expected.to contain_sssd_conf('pam/reconnection_retries').with_value('3') }
          it { is_expected.to contain_sssd_conf('pam/responder_idle_timeout').with_value('300') }
          it { is_expected.to contain_sssd_conf('pam/timeout').with_value('10') }

          case facts[:operatingsystemmajrelease]
          when '6'
            it { is_expected.to contain_datacat_fragment('sssd service pam') }
          else
            it { is_expected.to contain_service('sssd-pam.socket').with_enable(true) }
            it { is_expected.to contain_service('sssd-pam-priv.socket').with_enable(true) }
            it { is_expected.to have_datacat_fragment_resource_count(0) }
          end
        end

        context 'sudo service' do
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

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_sssd__service('sudo') }
          it { is_expected.to contain_sssd_conf('sudo/cache_first').with_value(false) }
          it { is_expected.to contain_sssd_conf('sudo/client_idle_timeout').with_value('60') }
          it { is_expected.to contain_sssd_conf('sudo/debug').with_value(30704) }
          it { is_expected.to contain_sssd_conf('sudo/debug_level').with_value(30704) }
          it { is_expected.to contain_sssd_conf('sudo/debug_microseconds').with_value('true') }
          it { is_expected.to contain_sssd_conf('sudo/debug_timestamps').with_value('true') }
          it { is_expected.to contain_sssd_conf('sudo/fd_limit').with_value('8192') }
          it { is_expected.to contain_sssd_conf('sudo/offline_timeout').with_value('60') }
          it { is_expected.to contain_sssd_conf('sudo/reconnection_retries').with_value('3') }
          it { is_expected.to contain_sssd_conf('sudo/responder_idle_timeout').with_value('300') }
          it { is_expected.to contain_sssd_conf('sudo/sudo_timed').with_value('false') }
          it { is_expected.to contain_sssd_conf('sudo/timeout').with_value('10') }

          case facts[:operatingsystemmajrelease]
          when '6'
            it { is_expected.to contain_datacat_fragment('sssd service sudo') }
          else
            it { is_expected.to contain_service('sssd-sudo.socket').with_enable(true) }
            it { is_expected.to have_datacat_fragment_resource_count(0) }
          end
        end

        context 'autofs service' do
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

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_sssd__service('autofs') }
          it { is_expected.to contain_sssd_conf('autofs/autofs_negative_timeout').with_value('15') }
          it { is_expected.to contain_sssd_conf('autofs/cache_first').with_value(false) }
          it { is_expected.to contain_sssd_conf('autofs/client_idle_timeout').with_value('60') }
          it { is_expected.to contain_sssd_conf('autofs/debug').with_value(30704) }
          it { is_expected.to contain_sssd_conf('autofs/debug_level').with_value(30704) }
          it { is_expected.to contain_sssd_conf('autofs/debug_microseconds').with_value('true') }
          it { is_expected.to contain_sssd_conf('autofs/debug_timestamps').with_value('true') }
          it { is_expected.to contain_sssd_conf('autofs/fd_limit').with_value('8192') }
          it { is_expected.to contain_sssd_conf('autofs/offline_timeout').with_value('60') }
          it { is_expected.to contain_sssd_conf('autofs/reconnection_retries').with_value('3') }
          it { is_expected.to contain_sssd_conf('autofs/responder_idle_timeout').with_value('300') }
          it { is_expected.to contain_sssd_conf('autofs/timeout').with_value('10') }

          case facts[:operatingsystemmajrelease]
          when '6'
            it { is_expected.to contain_datacat_fragment('sssd service autofs') }
          else
            it { is_expected.to contain_service('sssd-autofs.socket').with_enable(true) }
            it { is_expected.to have_datacat_fragment_resource_count(0) }
          end
        end

        context 'ssh service' do
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

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_sssd__service('ssh') }
          it { is_expected.to contain_sssd_conf('ssh/ca_db').with_value('/etc/pki/nssdb') }
          it { is_expected.to contain_sssd_conf('ssh/cache_first').with_value(false) }
          it { is_expected.to contain_sssd_conf('ssh/client_idle_timeout').with_value('60') }
          it { is_expected.to contain_sssd_conf('ssh/debug').with_value(30704) }
          it { is_expected.to contain_sssd_conf('ssh/debug_level').with_value(30704) }
          it { is_expected.to contain_sssd_conf('ssh/debug_microseconds').with_value('true') }
          it { is_expected.to contain_sssd_conf('ssh/debug_timestamps').with_value('true') }
          it { is_expected.to contain_sssd_conf('ssh/fd_limit').with_value('8192') }
          it { is_expected.to contain_sssd_conf('ssh/offline_timeout').with_value('60') }
          it { is_expected.to contain_sssd_conf('ssh/reconnection_retries').with_value('3') }
          it { is_expected.to contain_sssd_conf('ssh/responder_idle_timeout').with_value('300') }
          it { is_expected.to contain_sssd_conf('ssh/ssh_hash_known_hosts').with_value('true') }
          it { is_expected.to contain_sssd_conf('ssh/ssh_known_hosts_timeout').with_value('180') }
          it { is_expected.to contain_sssd_conf('ssh/timeout').with_value('10') }

          case facts[:operatingsystemmajrelease]
          when '6'
            it { is_expected.to contain_datacat_fragment('sssd service ssh') }
          else
            it { is_expected.to contain_service('sssd-ssh.socket').with_enable(true) }
            it { is_expected.to have_datacat_fragment_resource_count(0) }
          end
        end

        context 'pac service' do
          let(:title) do
            'pac'
          end

          let(:params) do
            super().merge(
              {
                :allowed_uids => [0],
                :pac_lifetime => 300,
              }
            )
          end

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_sssd__service('pac') }
          it { is_expected.to contain_sssd_conf('pac/allowed_uids').with_value('0') }
          it { is_expected.to contain_sssd_conf('pac/cache_first').with_value(false) }
          it { is_expected.to contain_sssd_conf('pac/client_idle_timeout').with_value('60') }
          it { is_expected.to contain_sssd_conf('pac/debug').with_value(30704) }
          it { is_expected.to contain_sssd_conf('pac/debug_level').with_value(30704) }
          it { is_expected.to contain_sssd_conf('pac/debug_microseconds').with_value('true') }
          it { is_expected.to contain_sssd_conf('pac/debug_timestamps').with_value('true') }
          it { is_expected.to contain_sssd_conf('pac/fd_limit').with_value('8192') }
          it { is_expected.to contain_sssd_conf('pac/offline_timeout').with_value('60') }
          it { is_expected.to contain_sssd_conf('pac/pac_lifetime').with_value(300) }
          it { is_expected.to contain_sssd_conf('pac/reconnection_retries').with_value('3') }
          it { is_expected.to contain_sssd_conf('pac/responder_idle_timeout').with_value('300') }
          it { is_expected.to contain_sssd_conf('pac/timeout').with_value('10') }

          case facts[:operatingsystemmajrelease]
          when '6'
            it { is_expected.to contain_datacat_fragment('sssd service pac') }
          else
            it { is_expected.to contain_service('sssd-pac.socket').with_enable(true) }
            it { is_expected.to have_datacat_fragment_resource_count(0) }
          end
        end

        context 'ifp service' do
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

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_sssd__service('ifp') }
          it { is_expected.to contain_sssd_conf('ifp/allowed_uids').with_value('0') }
          it { is_expected.to contain_sssd_conf('ifp/cache_first').with_value(false) }
          it { is_expected.to contain_sssd_conf('ifp/client_idle_timeout').with_value('60') }
          it { is_expected.to contain_sssd_conf('ifp/debug').with_value(30704) }
          it { is_expected.to contain_sssd_conf('ifp/debug_level').with_value(30704) }
          it { is_expected.to contain_sssd_conf('ifp/debug_microseconds').with_value('true') }
          it { is_expected.to contain_sssd_conf('ifp/debug_timestamps').with_value('true') }
          it { is_expected.to contain_sssd_conf('ifp/fd_limit').with_value('8192') }
          it { is_expected.to contain_sssd_conf('ifp/offline_timeout').with_value('60') }
          it { is_expected.to contain_sssd_conf('ifp/reconnection_retries').with_value('3') }
          it { is_expected.to contain_sssd_conf('ifp/responder_idle_timeout').with_value('300') }
          it { is_expected.to contain_sssd_conf('ifp/timeout').with_value('10') }
          it { is_expected.to contain_sssd_conf('ifp/user_attributes').with_value('+telephoneNumber') }
          it { is_expected.to contain_sssd_conf('ifp/wildcard_limit').with_value('1000') }

          case facts[:operatingsystemmajrelease]
          when '6'
            it { is_expected.to contain_datacat_fragment('sssd service ifp') }
          else
            it { is_expected.to have_datacat_fragment_resource_count(0) }
          end
        end
      end

      context 'with sssd class included and enabling socket activation' do
        let(:pre_condition) do
          'class { "::sssd": use_socket_activation => true }'
        end

        context 'nss service' do
          let(:title) do
            'nss'
          end

          case facts[:operatingsystemmajrelease]
          when '6'
            it { is_expected.to compile.and_raise_error(%r{Systemd is required for socket-activated services}) }
          else
            it { is_expected.to compile.with_all_deps }
            it { is_expected.to contain_service('sssd-nss.socket').with_enable(true) }
          end
        end
      end

      context 'with sssd class included and disabling socket activation' do
        let(:pre_condition) do
          'class { "::sssd": use_socket_activation => false }'
        end

        context 'nss service' do
          let(:title) do
            'nss'
          end

          it { is_expected.to compile.with_all_deps }

          case facts[:operatingsystemmajrelease]
          when '6'
            # noop
          else
            it { is_expected.to contain_service('sssd-nss.socket').with_enable(false).with_ensure('stopped') }
          end
        end
      end
    end
  end
end
