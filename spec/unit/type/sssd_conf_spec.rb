require 'spec_helper'

describe Puppet::Type.type(:sssd_conf) do
  it 'has :name, :section & :setting as its keyattributes' do
    expect(described_class.key_attributes).to eq([:name, :section, :setting])
  end

  describe 'when validating attributes' do
    [:name, :section, :setting, :target].each do |param|
      it "has a #{param} parameter" do
        expect(described_class.attrtype(param)).to eq(:param)
      end
    end

    [:ensure, :value].each do |property|
      it "has a #{property} property" do
        expect(described_class.attrtype(property)).to eq(:property)
      end
    end
  end

  describe 'autorequire' do
    let(:catalog) do
      Puppet::Resource::Catalog.new
    end

    it 'autorequires the targeted file' do
      file = Puppet::Type.type(:file).new(name: '/etc/sssd/sssd.conf', content: 'test')
      catalog.add_resource file
      key = described_class.new(name: 'foo/bar', target: '/etc/sssd/sssd.conf', value: 'baz', ensure: :present)
      catalog.add_resource key
      expect(key.autorequire.size).to eq(1)
    end
  end
end
