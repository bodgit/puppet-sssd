# @since 2.0.0
type SSSD::LDAP::Access::Order = Enum['filter', 'lockout', 'ppolicy', 'expire', 'pwd_expire_policy_reject', 'pwd_expire_policy_warn', 'pwd_expire_policy_renew', 'authorized_service', 'host']
