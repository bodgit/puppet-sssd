require 'spec_helper'

describe 'SSSD::Provider::ID' do
  it { is_expected.to allow_values('proxy', 'local', 'ldap', 'ipa', 'ad') }
  it { is_expected.not_to allow_value('invalid') }
end
