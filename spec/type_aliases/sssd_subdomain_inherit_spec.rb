require 'spec_helper'

describe 'SSSD::Subdomain::Inherit' do
  it { is_expected.to allow_values('ignore_group_members', 'ldap_purge_cache_timeout', 'ldap_use_tokengroups', 'ldap_user_principal', 'ldap_krb5_keytab') }
  it { is_expected.not_to allow_value('invalid') }
end
