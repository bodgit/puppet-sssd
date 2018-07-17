require 'spec_helper'

describe 'SSSD::AD::Access::Filter' do
  it { is_expected.to allow_value('(memberOf=cn=admins,ou=groups,dc=dom1,dc=com)') }
  it { is_expected.to allow_value('dom1:(memberOf=cn=admins,ou=groups,dc=dom1,dc=com)') }
  it { is_expected.to allow_value('DOM:dom2:(memberOf=cn=admins,ou=groups,dc=dom2,dc=com)') }
  it { is_expected.to allow_value('FOREST:EXAMPLE.COM:(memberOf=cn=admins,ou=groups,dc=example,dc=com)') }
  it { is_expected.not_to allow_value('invalid') }
end
