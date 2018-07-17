require 'spec_helper'

describe 'SSSD::LDAP::Access::Order' do
  it { is_expected.to allow_values('filter', 'lockout', 'ppolicy', 'expire', 'pwd_expire_policy_reject', 'pwd_expire_policy_warn', 'pwd_expire_policy_renew', 'authorized_service', 'host') }
  it { is_expected.not_to allow_value('invalid') }
end
