require 'spec_helper'

describe 'sssd' do

  let(:params) do
    {
      :debug_level           => '0x77f0',
      :debug_timestamps      => true,
      :debug_microseconds    => true,
      :reconnection_retries  => 3,
      :re_expression         => '(?P<name>[^@]+)@?(?P<domain>[^@]*$)',
      :full_name_format      => '%1$s',
      :try_inotify           => true,
      :krb5_rcache_dir       => '/tmp',
      :user                  => 'sssd',
      :default_domain_suffix => 'example.com',
      :override_space        => '_',
    }
  end

  context 'on unsupported distributions' do
    let(:facts) do
      {
        :osfamily => 'Unsupported'
      }
    end

    it { expect { should compile }.to raise_error(/not supported on an Unsupported/) }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}", :compile do
      let(:facts) do
        facts
      end

      it { should contain_anchor('sssd::begin') }
      it { should contain_anchor('sssd::end') }
      it { should contain_class('sssd') }
      it { should contain_class('sssd::config') }
      it { should contain_class('sssd::install') }
      it { should contain_class('sssd::params') }
      it { should contain_class('sssd::daemon') }
      it { should contain_datacat_collector('sssd domains') }
      it { should contain_datacat_collector('sssd services') }
      it { should contain_file('/etc/sssd') }
      it { should contain_file('/etc/sssd/sssd.conf') }
      it { should contain_package('sssd') }
      it { should contain_resources('sssd_conf') }
      it { should contain_service('sssd') }
      it { should contain_sssd_conf('sssd/config_file_version').with_value('2') }
      it { should contain_sssd_conf('sssd/domains').with_value('') }
      it { should contain_sssd_conf('sssd/services').with_value('') }
      it { should contain_sssd_conf('sssd/debug_level').with_value('0x77f0') }
      it { should contain_sssd_conf('sssd/debug_microseconds').with_value('true') }
      it { should contain_sssd_conf('sssd/debug_timestamps').with_value('true') }
      it { should contain_sssd_conf('sssd/default_domain_suffix').with_value('example.com') }
      it { should contain_sssd_conf('sssd/full_name_format').with_value('%1$s') }
      it { should contain_sssd_conf('sssd/krb5_rcache_dir').with_value('/tmp') }
      it { should contain_sssd_conf('sssd/override_space').with_value('_') }
      it { should contain_sssd_conf('sssd/re_expression').with_value('(?P<name>[^@]+)@?(?P<domain>[^@]*$)') }
      it { should contain_sssd_conf('sssd/reconnection_retries').with_value('3') }
      it { should contain_sssd_conf('sssd/try_inotify').with_value('true') }
      it { should contain_sssd_conf('sssd/user').with_value('sssd') }
    end
  end
end
