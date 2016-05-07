require 'spec_helper'

describe 'sssd::dbus' do

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

    it { expect { should compile }.to raise_error(/not supported on an Unsupported/) }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge({
          :dbus_startup_provider => 'init',
        })
      end

      context 'without sssd class included' do
        let(:title) do
          'test'
        end

        it { expect { should compile }.to raise_error(/must include the sssd base class/) }
      end

      context 'with sssd class included', :compile do
        let(:pre_condition) do
          'include ::sssd include ::dbus'
        end

        it { should contain_anchor('sssd::dbus::begin') }
        it { should contain_anchor('sssd::dbus::end') }
        it { should contain_class('sssd::dbus') }
        it { should contain_class('sssd::dbus::config') }
        it { should contain_class('sssd::dbus::install') }
        it { should contain_class('sssd::params') }
        it { should contain_dbus__system('org.freedesktop.sssd.infopipe') }
        it { should contain_package('sssd-dbus') }
        it { should contain_sssd__service('ifp') }
      end
    end
  end
end
