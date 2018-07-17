require 'spec_helper'

describe 'SSSD::Provider::Auth' do
  it { is_expected.to allow_values('ldap', 'krb5', 'ipa', 'ad', 'proxy', 'local', 'none') }
  it { is_expected.not_to allow_value('invalid') }
end
