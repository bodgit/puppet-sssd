require 'spec_helper'

describe 'sssd' do

  let(:params) do
    {
      :domains                  => {
        'test' => {
          'id_provider' => 'ldap',
        },
      },
      :services                 => {
        'nss' => {},
      },
      :debug                    => 0x77f0,
      :debug_level              => 0x77f0,
      :debug_timestamps         => true,
      :debug_microseconds       => true,
      :reconnection_retries     => 3,
      :re_expression            => '(?P<name>[^@]+)@?(?P<domain>[^@]*$)',
      :full_name_format         => '%1$s',
      :try_inotify              => true,
      :krb5_rcache_dir          => '/tmp',
      :user                     => 'sssd',
      :default_domain_suffix    => 'example.com',
      :override_space           => '_',
      :certificate_verification => [
        'no_ocsp',
        'no_verification',
        [
          'ocsp_default_responder',
          'http://example.com:80/ocsp',
        ],
        [
          'ocsp_default_responder_signing_cert',
          'example',
        ],
      ],
      :disable_netlink          => true,
      :enable_files_domain      => true,
      :domain_resolution_order  => [
        'example.com',
        'test.example.com',
      ],
    }
  end

  context 'on unsupported distributions' do
    let(:facts) do
      {
        :osfamily => 'Unsupported'
      }
    end

    it { is_expected.to compile.and_raise_error(%r{not supported on an Unsupported}) }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('sssd') }
      it { is_expected.to contain_class('sssd::config') }
      it { is_expected.to contain_class('sssd::install') }
      it { is_expected.to contain_class('sssd::params') }
      it { is_expected.to contain_class('sssd::daemon') }
      it { is_expected.to contain_datacat_collector('sssd domains') }
      it { is_expected.to contain_datacat_collector('sssd services') }
      it { is_expected.to contain_file('/etc/sssd') }
      it { is_expected.to contain_file('/etc/sssd/sssd.conf') }
      it { is_expected.to contain_package('sssd') }
      it { is_expected.to contain_resources('sssd_conf') }
      it { is_expected.to contain_service('sssd') }
      it { is_expected.to contain_sssd_conf('sssd/certificate_verification').with_value('no_ocsp, no_verification, ocsp_default_responder=http://example.com:80/ocsp, ocsp_default_responder_signing_cert=example') }
      it { is_expected.to contain_sssd_conf('sssd/config_file_version').with_value('2') }
      it { is_expected.to contain_sssd_conf('sssd/domains').with_value('') }
      it { is_expected.to contain_sssd_conf('sssd/services').with_value('') }
      it { is_expected.to contain_sssd_conf('sssd/debug').with_value(30704) }
      it { is_expected.to contain_sssd_conf('sssd/debug_level').with_value(30704) }
      it { is_expected.to contain_sssd_conf('sssd/debug_microseconds').with_value('true') }
      it { is_expected.to contain_sssd_conf('sssd/debug_timestamps').with_value('true') }
      it { is_expected.to contain_sssd_conf('sssd/default_domain_suffix').with_value('example.com') }
      it { is_expected.to contain_sssd_conf('sssd/disable_netlink').with_value(true) }
      it { is_expected.to contain_sssd_conf('sssd/domain_resolution_order').with_value('example.com, test.example.com') }
      it { is_expected.to contain_sssd_conf('sssd/enable_files_domain').with_value(true) }
      it { is_expected.to contain_sssd_conf('sssd/full_name_format').with_value('%1$s') }
      it { is_expected.to contain_sssd_conf('sssd/krb5_rcache_dir').with_value('/tmp') }
      it { is_expected.to contain_sssd_conf('sssd/override_space').with_value('_') }
      it { is_expected.to contain_sssd_conf('sssd/re_expression').with_value('(?P<name>[^@]+)@?(?P<domain>[^@]*$)') }
      it { is_expected.to contain_sssd_conf('sssd/reconnection_retries').with_value('3') }
      it { is_expected.to contain_sssd_conf('sssd/try_inotify').with_value('true') }
      it { is_expected.to contain_sssd_conf('sssd/user').with_value('sssd') }

      case facts[:operatingsystemmajrelease]
      when '6'
        # noop
      else
        it { is_expected.to contain_exec('systemctl daemon-reload') }
        it { is_expected.to contain_file('/etc/systemd/system/sssd-autofs.service.d') }
        it { is_expected.to contain_file('/etc/systemd/system/sssd-autofs.service.d/override.conf') }
        it { is_expected.to contain_file('/etc/systemd/system/sssd-pac.service.d') }
        it { is_expected.to contain_file('/etc/systemd/system/sssd-pac.service.d/override.conf') }
        it { is_expected.to contain_file('/etc/systemd/system/sssd-pam.service.d') }
        it { is_expected.to contain_file('/etc/systemd/system/sssd-pam.service.d/override.conf') }
        it { is_expected.to contain_file('/etc/systemd/system/sssd-ssh.service.d') }
        it { is_expected.to contain_file('/etc/systemd/system/sssd-ssh.service.d/override.conf') }
        it { is_expected.to contain_file('/etc/systemd/system/sssd-sudo.service.d') }
        it { is_expected.to contain_file('/etc/systemd/system/sssd-sudo.service.d/override.conf') }
      end
    end
  end
end
