require 'spec_helper'

describe 'sssd::dbus' do

  let(:params) do
    {
      :debug                => 0x77f0,
      :debug_level          => 0x77f0,
      :debug_timestamps     => true,
      :debug_microseconds   => true,
      :timeout              => 10,
      :reconnection_retries => 3,
      :fd_limit             => 8192,
      :client_idle_timeout  => 60,
      :offline_timeout      => 60,
      :allowed_uids         => [0],
      :user_attributes      => ['+telephoneNumber'],
      :wildcard_limit       => 1000,
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

      context 'without sssd class included' do
        it { is_expected.to compile.and_raise_error(%r{must include the sssd base class}) }
      end

      context 'with sssd class included' do
        let(:pre_condition) do
          'include ::sssd include ::dbus'
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('sssd::dbus') }
        it { is_expected.to contain_class('sssd::dbus::config') }
        it { is_expected.to contain_class('sssd::dbus::install') }
        it { is_expected.to contain_class('sssd::params') }
        it { is_expected.to contain_dbus__system('org.freedesktop.sssd.infopipe') }
        it { is_expected.to contain_package('sssd-dbus') }
        it { is_expected.to contain_sssd__service('ifp') }
      end
    end
  end
end
