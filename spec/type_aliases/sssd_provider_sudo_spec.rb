require 'spec_helper'

describe 'SSSD::Provider::Sudo' do
  it { is_expected.to allow_values('ldap', 'ipa', 'ad', 'none') }
  it { is_expected.not_to allow_value('invalid') }
end
