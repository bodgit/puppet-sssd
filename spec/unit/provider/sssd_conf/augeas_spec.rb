require 'spec_helper'

describe Puppet::Type.type(:sssd_conf).provider(:augeas) do

  before :each do
    Puppet::Type.type(:sssd_conf).stubs(:defaultprovider).returns described_class
  end

  describe '.instances' do
    it 'should have an instances method' do
      expect(described_class).to respond_to(:instances)
    end
  end
end
