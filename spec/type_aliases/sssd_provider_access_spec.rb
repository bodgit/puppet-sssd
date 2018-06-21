require 'spec_helper'

describe 'SSSD::Provider::Access' do
  it { is_expected.to allow_values('permit', 'deny', 'ldap', 'ipa', 'ad', 'simple', 'krb5', 'proxy') }
  it { is_expected.not_to allow_value('invalid') }
end
