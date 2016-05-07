require 'spec_helper'

provider_class = Puppet::Type.type(:sssd_conf).provider(:augeas)

describe provider_class do

  before :each do
    Puppet::Type.type(:sssd_conf).stubs(:defaultprovider).returns described_class
    FileTest.stubs(:exist?).returns false
    FileTest.stubs(:exist?).with('/etc/sssd/sssd.conf').returns true
  end

  context 'with empty file' do
    let(:tmptarget) { aug_fixture('empty') }
    let(:target) { tmptarget.path }

    it 'should create simple new entry' do
      apply!(Puppet::Type.type(:sssd_conf).new(
        :name     => 'test',
        :section  => 'sssd',
        :setting  => 'services',
        :value    => 'nss, pam',
        :target   => target,
        :provider => 'augeas',
      ))

      aug_open(target, 'Sssd.lns') do |aug|
        expect(aug.get("target[. = 'sssd']/services")).to eq('nss, pam')
      end
    end
  end

  context 'with full file' do
    let(:tmptarget) { aug_fixture('full') }
    let(:target) { tmptarget.path }

    it 'should list instances' do
      provider_class.stubs(:target).returns(target)
      inst = provider_class.instances.map { |p|
        {
          :name    => p.get(:name),
          :ensure  => p.get(:ensure),
          :section => p.get(:section),
          :setting => p.get(:setting),
          :value   => p.get(:value),
        }
      }

      expect(inst.size).to eq(1)
      expect(inst[0]).to eq({:name => 'sssd/services', :ensure => :present, :section => 'sssd', :setting => 'services', :value => 'nss, pam'})
    end

    describe 'when deleting settings' do
      it 'should delete a setting' do
        expr = "target[. = 'sssd']/services"
        aug_open(target, 'Sssd.lns') do |aug|
          expect(aug.match(expr)).not_to eq([])
        end

        apply!(Puppet::Type.type(:sssd_conf).new(
          :name     => 'sssd/services',
          :ensure   => 'absent',
          :target   => target,
          :provider => 'augeas',
        ))

        aug_open(target, 'Sssd.lns') do |aug|
          expect(aug.match(expr)).to eq([])
        end
      end
    end
  end
end
