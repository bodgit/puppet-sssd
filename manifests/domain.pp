#
define sssd::domain (
  $id_provider,
  # options for any section
  $debug_level                                   = undef,
  $debug_timestamps                              = undef,
  $debug_microseconds                            = undef,
  # generic domain options
  $timeout                                       = undef,
  $max_id                                        = undef,
  $min_id                                        = undef,
  $enumerate                                     = undef,
  $subdomain_enumerate                           = undef,
  $force_timeout                                 = undef,
  $entry_cache_timeout                           = undef,
  $entry_cache_user_timeout                      = undef,
  $entry_cache_group_timeout                     = undef,
  $entry_cache_netgroup_timeout                  = undef,
  $entry_cache_service_timeout                   = undef,
  $entry_cache_sudo_timeout                      = undef,
  $entry_cache_autofs_timeout                    = undef,
  $entry_cache_ssh_host_timeout                  = undef,
  $refresh_expired_interval                      = undef,
  $cache_credentials                             = undef,
  $cache_credentials_minimal_first_factor_length = undef,
  $account_cache_expiration                      = undef,
  $pwd_expiration_warning                        = undef,
  $use_fully_qualified_names                     = undef,
  $ignore_group_members                          = undef,
  $auth_provider                                 = undef,
  $access_provider                               = undef,
  $chpass_provider                               = undef,
  $sudo_provider                                 = undef,
  $selinux_provider                              = undef,
  $subdomains_provider                           = undef,
  $autofs_provider                               = undef,
  $hostid_provider                               = undef,
  $re_expression                                 = undef,
  $full_name_format                              = undef,
  $lookup_family_order                           = undef,
  $dns_resolver_timeout                          = undef,
  $dns_discovery_domain                          = undef,
  $override_gid                                  = undef,
  $case_sensitive                                = undef,
  $proxy_fast_alias                              = undef,
  $subdomain_homedir                             = undef,
  $realmd_tags                                   = undef,
  $cached_auth_timeout                           = undef,
  $dyndns_update                                 = undef,
  $dyndns_ttl                                    = undef,
  $dyndns_iface                                  = undef,
  $dyndns_refresh_interval                       = undef,
  $dyndns_update_ptr                             = undef,
  $dyndns_force_tcp                              = undef,
  $dyndns_server                                 = undef,
  $override_homedir                              = undef,
  $homedir_substring                             = undef,
  $wildcard_limit                                = undef,
  # simple access provider
  $simple_allow_users                            = undef,
  $simple_deny_users                             = undef,
  $simple_allow_groups                           = undef,
  $simple_deny_groups                            = undef,
  # proxy
  $proxy_pam_target                              = undef,
  $proxy_lib_name                                = undef,
  # local
  $default_shell                                 = undef,
  $base_directory                                = undef,
  $create_homedir                                = undef,
  $remove_homedir                                = undef,
  $homedir_umask                                 = undef,
  $skel_dir                                      = undef,
  $mail_dir                                      = undef,
  $userdel_cmd                                   = undef,
  # ldap
  $ldap_uri                                      = undef,
  $ldap_backup_uri                               = undef,
  $ldap_chpass_uri                               = undef,
  $ldap_chpass_backup_uri                        = undef,
  $ldap_search_base                              = undef,
  $ldap_schema                                   = undef,
  $ldap_default_bind_dn                          = undef,
  $ldap_default_authtok_type                     = undef,
  $ldap_default_authtok                          = undef,
  $ldap_user_object_class                        = undef,
  $ldap_user_name                                = undef,
  $ldap_user_uid_number                          = undef,
  $ldap_user_gid_number                          = undef,
  $ldap_user_gecos                               = undef,
  $ldap_user_home_directory                      = undef,
  $ldap_user_shell                               = undef,
  $ldap_user_uuid                                = undef,
  $ldap_user_objectsid                           = undef,
  $ldap_user_modify_timestamp                    = undef,
  $ldap_user_shadow_last_change                  = undef,
  $ldap_user_shadow_min                          = undef,
  $ldap_user_shadow_max                          = undef,
  $ldap_user_shadow_warning                      = undef,
  $ldap_user_shadow_inactive                     = undef,
  $ldap_user_shadow_expire                       = undef,
  $ldap_user_krb_last_pwd_change                 = undef,
  $ldap_user_krb_password_expiration             = undef,
  $ldap_user_ad_account_expires                  = undef,
  $ldap_user_ad_user_account_control             = undef,
  $ldap_ns_account_lock                          = undef,
  $ldap_user_nds_login_disabled                  = undef,
  $ldap_user_nds_login_expiration_time           = undef,
  $ldap_user_nds_login_allowed_time_map          = undef,
  $ldap_user_principal                           = undef,
  $ldap_user_extra_attrs                         = undef,
  $ldap_user_ssh_public_key                      = undef,
  $ldap_force_upper_case_realm                   = undef,
  $ldap_enumeration_refresh_timeout              = undef,
  $ldap_purge_cache_timeout                      = undef,
  $ldap_user_fullname                            = undef,
  $ldap_user_member_of                           = undef,
  $ldap_user_authorized_service                  = undef,
  $ldap_user_authorized_host                     = undef,
  $ldap_user_certificate                         = undef,
  $ldap_group_object_class                       = undef,
  $ldap_group_name                               = undef,
  $ldap_group_gid_number                         = undef,
  $ldap_group_member                             = undef,
  $ldap_group_uuid                               = undef,
  $ldap_group_objectsid                          = undef,
  $ldap_group_modify_timestamp                   = undef,
  $ldap_group_type                               = undef,
  $ldap_group_external_member                    = undef,
  $ldap_group_nesting_level                      = undef,
  $ldap_groups_use_matching_rule_in_chain        = undef,
  $ldap_initgroups_use_matching_rule_in_chain    = undef,
  $ldap_use_tokengroups                          = undef,
  $ldap_netgroup_object_class                    = undef,
  $ldap_netgroup_name                            = undef,
  $ldap_netgroup_member                          = undef,
  $ldap_netgroup_triple                          = undef,
  $ldap_netgroup_modify_timestamp                = undef,
  $ldap_service_object_class                     = undef,
  $ldap_service_name                             = undef,
  $ldap_service_port                             = undef,
  $ldap_service_proto                            = undef,
  $ldap_service_search_base                      = undef,
  $ldap_search_timeout                           = undef,
  $ldap_enumeration_search_timeout               = undef,
  $ldap_network_timeout                          = undef,
  $ldap_opt_timeout                              = undef,
  $ldap_connection_expire_timeout                = undef,
  $ldap_page_size                                = undef,
  $ldap_disable_paging                           = undef,
  $ldap_disable_range_retrieval                  = undef,
  $ldap_sasl_minssf                              = undef,
  $ldap_deref_threshold                          = undef,
  $ldap_tls_reqcert                              = undef,
  $ldap_tls_cacert                               = undef,
  $ldap_tls_cacertdir                            = undef,
  $ldap_tls_cert                                 = undef,
  $ldap_tls_key                                  = undef,
  $ldap_tls_cipher_suite                         = undef,
  $ldap_id_use_start_tls                         = undef,
  $ldap_id_mapping                               = undef,
  $ldap_idmap_range_min                          = undef,
  $ldap_idmap_range_max                          = undef,
  $ldap_idmap_range_size                         = undef,
  $ldap_idmap_default_domain_sid                 = undef,
  $ldap_idmap_default_domain                     = undef,
  $ldap_idmap_autorid_compat                     = undef,
  $ldap_min_id                                   = undef,
  $ldap_max_id                                   = undef,
  $ldap_sasl_mech                                = undef,
  $ldap_sasl_authid                              = undef,
  $ldap_sasl_realm                               = undef,
  $ldap_sasl_canonicalize                        = undef,
  $ldap_krb5_keytab                              = undef,
  $ldap_krb5_init_creds                          = undef,
  $ldap_krb5_ticket_lifetime                     = undef,
  $ldap_pwd_policy                               = undef,
  $ldap_referrals                                = undef,
  $ldap_dns_service_name                         = undef,
  $ldap_chpass_dns_service_name                  = undef,
  $ldap_chpass_update_last_change                = undef,
  $ldap_access_filter                            = undef,
  $ldap_account_expire_policy                    = undef,
  $ldap_access_order                             = undef,
  $ldap_pwdlockout_dn                            = undef,
  $ldap_deref                                    = undef,
  $ldap_rfc2307_fallback_to_local_users          = undef,
  $ldap_sudorule_object_class                    = undef,
  $ldap_sudorule_name                            = undef,
  $ldap_sudorule_command                         = undef,
  $ldap_sudorule_host                            = undef,
  $ldap_sudorule_user                            = undef,
  $ldap_sudorule_option                          = undef,
  $ldap_sudorule_runasuser                       = undef,
  $ldap_sudorule_runasgroup                      = undef,
  $ldap_sudorule_notbefore                       = undef,
  $ldap_sudorule_notafter                        = undef,
  $ldap_sudorule_order                           = undef,
  $ldap_sudo_full_refresh_interval               = undef,
  $ldap_sudo_smart_refresh_interval              = undef,
  $ldap_sudo_use_host_filter                     = undef,
  $ldap_sudo_hostnames                           = undef,
  $ldap_sudo_ip                                  = undef,
  $ldap_sudo_include_netgroups                   = undef,
  $ldap_sudo_include_regexp                      = undef,
  $ldap_autofs_map_master_name                   = undef,
  $ldap_autofs_map_object_class                  = undef,
  $ldap_autofs_map_name                          = undef,
  $ldap_autofs_entry_object_class                = undef,
  $ldap_autofs_entry_key                         = undef,
  $ldap_autofs_entry_value                       = undef,
  $ldap_netgroup_search_base                     = undef,
  $ldap_user_search_base                         = undef,
  $ldap_group_search_base                        = undef,
  $ldap_sudo_search_base                         = undef,
  $ldap_autofs_search_base                       = undef,
  # krb5
  $krb5_server                                   = undef,
  $krb5_backup_server                            = undef,
  $krb5_realm                                    = undef,
  $krb5_canonicalize                             = undef,
  $krb5_use_kdcinfo                              = undef,
  $krb5_kpasswd                                  = undef,
  $krb5_backup_kpasswd                           = undef,
  $krb5_ccachedir                                = undef,
  $krb5_ccname_template                          = undef,
  $krb5_auth_timeout                             = undef,
  $krb5_validate                                 = undef,
  $krb5_keytab                                   = undef,
  $krb5_store_password_if_offline                = undef,
  $krb5_renewable_lifetime                       = undef,
  $krb5_lifetime                                 = undef,
  $krb5_renew_interval                           = undef,
  $krb5_use_fast                                 = undef,
  $krb5_fast_principal                           = undef,
  $krb5_use_enterprise_principal                 = undef,
  $krb5_map_user                                 = undef,
  $krb5_confd_path                               = undef,
  # ad
  $ad_domain                                     = undef,
  $ad_server                                     = undef,
  $ad_backup_server                              = undef,
  $ad_hostname                                   = undef,
  $ad_enable_dns_sites                           = undef,
  $ad_access_filter                              = undef,
  $ad_site                                       = undef,
  $ad_enable_gc                                  = undef,
  $ad_gpo_access_control                         = undef,
  $ad_gpo_cache_timeout                          = undef,
  $ad_gpo_map_interactive                        = undef,
  $ad_gpo_map_remote_interactive                 = undef,
  $ad_gpo_map_network                            = undef,
  $ad_gpo_map_batch                              = undef,
  $ad_gpo_map_service                            = undef,
  $ad_gpo_map_permit                             = undef,
  $ad_gpo_map_deny                               = undef,
  $ad_gpo_default_right                          = undef,
  # ipa
  $ipa_domain                                    = undef,
  $ipa_server                                    = undef,
  $ipa_backup_server                             = undef,
  $ipa_hostname                                  = undef,
  $ipa_enable_dns_sites                          = undef,
  $ipa_hbac_search_base                          = undef,
  $ipa_host_search_base                          = undef,
  $ipa_selinux_search_base                       = undef,
  $ipa_subdomains_search_base                    = undef,
  $ipa_master_domain_search_base                 = undef,
  $ipa_views_search_base                         = undef,
  $ipa_hbac_refresh                              = undef,
  $ipa_hbac_selinux                              = undef,
  $ipa_server_mode                               = undef,
  $ipa_automount_location                        = undef,
  $ipa_view_class                                = undef,
  $ipa_view_name                                 = undef,
  $ipa_override_object_class                     = undef,
  $ipa_anchor_uuid                               = undef,
  $ipa_user_override_object_class                = undef,
  $ipa_group_override_object_class               = undef,
) {

  if ! defined(Class['::sssd']) {
    fail('You must include the sssd base class before using any sssd defined resources') # lint:ignore:80chars
  }

  validate_re($id_provider, '^(proxy|local|ldap|ipa|ad)$')

  if $debug_level {
    validate_re($debug_level, ['^\d+$', '^0x[\da-fA-F]+$'])
  }
  if $debug_timestamps {
    validate_bool($debug_timestamps)
  }
  if $debug_microseconds {
    validate_bool($debug_microseconds)
  }
  if $timeout {
    validate_integer($timeout, '', 0)
  }

  if $max_id {
    validate_integer($max_id, '', 0)
  }
  if $min_id {
    validate_integer($min_id, '', 0)
  }
  if $enumerate {
    validate_bool($enumerate)
  }
  if $subdomain_enumerate {
    validate_array($subdomain_enumerate)
  }
  if $force_timeout {
    validate_integer($force_timeout, '', 0)
  }
  if $entry_cache_timeout {
    validate_integer($entry_cache_timeout, '', 0)
  }
  if $entry_cache_user_timeout {
    validate_integer($entry_cache_user_timeout, '', 0)
  }
  if $entry_cache_group_timeout {
    validate_integer($entry_cache_group_timeout, '', 0)
  }
  if $entry_cache_netgroup_timeout {
    validate_integer($entry_cache_netgroup_timeout, '', 0)
  }
  if $entry_cache_service_timeout {
    validate_integer($entry_cache_service_timeout, '', 0)
  }
  if $entry_cache_sudo_timeout {
    validate_integer($entry_cache_sudo_timeout, '', 0)
  }
  if $entry_cache_autofs_timeout {
    validate_integer($entry_cache_autofs_timeout, '', 0)
  }
  if $entry_cache_ssh_host_timeout {
    validate_integer($entry_cache_ssh_host_timeout, '', 0)
  }
  if $refresh_expired_interval {
    validate_integer($refresh_expired_interval, '', 0)
  }
  if $cache_credentials {
    validate_bool($cache_credentials)
  }
  if $cache_credentials_minimal_first_factor_length {
    validate_integer($cache_credentials_minimal_first_factor_length, '', 0)
  }
  if $account_cache_expiration {
    validate_integer($account_cache_expiration, '', 0)
  }
  if $pwd_expiration_warning {
    validate_integer($pwd_expiration_warning, '', 0)
  }
  if $use_fully_qualified_names {
    validate_bool($use_fully_qualified_names)
  }
  if $ignore_group_members {
    validate_bool($ignore_group_members)
  }
  if $auth_provider {
    validate_re($auth_provider, '^(ldap|krb5|ipa|ad|proxy|local|none)$')
  }
  if $access_provider {
    validate_re($access_provider, '^(permit|deny|ldap|ipa|ad|simple)$')
  }
  if $chpass_provider {
    validate_re($chpass_provider, '^(ldap|krb5|ipa|ad|proxy|none)$')
  }
  if $sudo_provider {
    validate_re($sudo_provider, '^(ldap|ipa|ad|none)$')
  }
  if $selinux_provider {
    validate_re($selinux_provider, '^(ipa|none)$')
  }
  if $subdomains_provider {
    validate_re($subdomains_provider, '^(ipa|ad|none)$')
  }
  if $autofs_provider {
    validate_re($autofs_provider, '^(ldap|ipa|none)$')
  }
  if $hostid_provider {
    validate_re($hostid_provider, '^(ipa|none)$')
  }
  validate_string($re_expression)
  validate_string($full_name_format)
  if $lookup_family_order {
    validate_re($lookup_family_order, '^ipv[46]_(first|only)$')
  }
  if $dns_resolver_timeout {
    validate_integer($dns_resolver_timeout, '', 0)
  }
  validate_string($dns_discovery_domain)
  if $override_gid {
    validate_integer($override_gid, '', 0)
  }
  if $case_sensitive {
    validate_re($case_sensitive, '^(true|false|preserving)$')
  }
  if $proxy_fast_alias {
    validate_bool($proxy_fast_alias)
  }
  if $subdomain_homedir {
    validate_absolute_path($subdomain_homedir)
  }
  if $realmd_tags {
    validate_array($realmd_tags)
  }
  if $cached_auth_timeout {
    validate_integer($cached_auth_timeout, '', 0)
  }
  if $dyndns_update {
    validate_bool($dyndns_update)
  }
  if $dyndns_ttl {
    validate_integer($dyndns_ttl, '', 0)
  }
  validate_string($dyndns_iface)
  if $dyndns_refresh_interval {
    validate_integer($dyndns_refresh_interval, '', 0)
  }
  if $dyndns_update_ptr {
    validate_bool($dyndns_update_ptr)
  }
  if $dyndns_force_tcp {
    validate_bool($dyndns_force_tcp)
  }
  validate_string($dyndns_server)
  if $override_homedir {
    validate_absolute_path($override_homedir)
  }
  if $homedir_substring {
    validate_absolute_path($homedir_substring)
  }
  if $wildcard_limit {
    validate_integer($wildcard_limit, '', 0)
  }
  if $simple_allow_users {
    validate_array($simple_allow_users)
  }
  if $simple_deny_users {
    validate_array($simple_deny_users)
  }
  if $simple_allow_groups {
    validate_array($simple_allow_groups)
  }
  if $simple_deny_groups {
    validate_array($simple_deny_groups)
  }
  validate_string($proxy_pam_target)
  validate_string($proxy_lib_name)
  if $default_shell {
    validate_absolute_path($default_shell)
  }
  if $base_directory {
    validate_absolute_path($base_directory)
  }
  if $create_homedir {
    validate_bool($create_homedir)
  }
  if $remove_homedir {
    validate_bool($remove_homedir)
  }
  if $homedir_umask {
    validate_re($homedir_umask, '^[0-7]{3}$')
  }
  if $skel_dir {
    validate_absolute_path($skel_dir)
  }
  if $mail_dir {
    validate_absolute_path($mail_dir)
  }
  validate_string($userdel_cmd)
  if $ldap_uri {
    validate_array($ldap_uri)
  }
  if $ldap_backup_uri {
    validate_array($ldap_backup_uri)
  }
  if $ldap_chpass_uri {
    validate_array($ldap_chpass_uri)
  }
  if $ldap_chpass_backup_uri {
    validate_array($ldap_chpass_backup_uri)
  }
  validate_string($ldap_search_base)
  if $ldap_schema {
    validate_re($ldap_schema, '^(rfc2307(bis)?|ipa|ad)$')
  }
  validate_string($ldap_default_bind_dn)
  if $ldap_default_authtok_type {
    validate_re($ldap_default_authtok_type, '^(obfuscated_)?password$')
  }
  validate_string($ldap_default_authtok)
  validate_string($ldap_user_object_class)
  validate_string($ldap_user_name)
  validate_string($ldap_user_uid_number)
  validate_string($ldap_user_gid_number)
  validate_string($ldap_user_gecos)
  validate_string($ldap_user_home_directory)
  validate_string($ldap_user_shell)
  validate_string($ldap_user_uuid)
  validate_string($ldap_user_objectsid)
  validate_string($ldap_user_modify_timestamp)
  validate_string($ldap_user_shadow_last_change)
  validate_string($ldap_user_shadow_min)
  validate_string($ldap_user_shadow_max)
  validate_string($ldap_user_shadow_warning)
  validate_string($ldap_user_shadow_inactive)
  validate_string($ldap_user_shadow_expire)
  validate_string($ldap_user_krb_last_pwd_change)
  validate_string($ldap_user_krb_password_expiration)
  validate_string($ldap_user_ad_account_expires)
  validate_string($ldap_user_ad_user_account_control)
  validate_string($ldap_ns_account_lock)
  validate_string($ldap_user_nds_login_disabled)
  validate_string($ldap_user_nds_login_expiration_time)
  validate_string($ldap_user_nds_login_allowed_time_map)
  validate_string($ldap_user_principal)
  if $ldap_user_extra_attrs {
    validate_array($ldap_user_extra_attrs)
  }
  validate_string($ldap_user_ssh_public_key)
  if $ldap_force_upper_case_realm {
    validate_bool($ldap_force_upper_case_realm)
  }
  if $ldap_enumeration_refresh_timeout {
    validate_integer($ldap_enumeration_refresh_timeout, '', 0)
  }
  if $ldap_purge_cache_timeout {
    validate_integer($ldap_purge_cache_timeout, '', 0)
  }
  validate_string($ldap_user_fullname)
  validate_string($ldap_user_member_of)
  validate_string($ldap_user_authorized_service)
  validate_string($ldap_user_authorized_host)
  validate_string($ldap_user_certificate)
  validate_string($ldap_group_object_class)
  validate_string($ldap_group_name)
  validate_string($ldap_group_gid_number)
  validate_string($ldap_group_member)
  validate_string($ldap_group_uuid)
  validate_string($ldap_group_objectsid)
  validate_string($ldap_group_modify_timestamp)
  validate_string($ldap_group_type)
  validate_string($ldap_group_external_member)
  if $ldap_group_nesting_level {
    validate_integer($ldap_group_nesting_level, '', 0)
  }
  if $ldap_groups_use_matching_rule_in_chain {
    validate_bool($ldap_groups_use_matching_rule_in_chain)
  }
  if $ldap_initgroups_use_matching_rule_in_chain {
    validate_bool($ldap_initgroups_use_matching_rule_in_chain)
  }
  if $ldap_use_tokengroups {
    validate_bool($ldap_use_tokengroups)
  }
  validate_string($ldap_netgroup_object_class)
  validate_string($ldap_netgroup_name)
  validate_string($ldap_netgroup_member)
  validate_string($ldap_netgroup_triple)
  validate_string($ldap_netgroup_modify_timestamp)
  validate_string($ldap_service_object_class)
  validate_string($ldap_service_name)
  validate_string($ldap_service_port)
  validate_string($ldap_service_proto)
  validate_string($ldap_service_search_base)
  if $ldap_search_timeout {
    validate_integer($ldap_search_timeout, '', 0)
  }
  if $ldap_enumeration_search_timeout {
    validate_integer($ldap_enumeration_search_timeout, '', 0)
  }
  if $ldap_network_timeout {
    validate_integer($ldap_network_timeout, '', 0)
  }
  if $ldap_opt_timeout {
    validate_integer($ldap_opt_timeout, '', 0)
  }
  if $ldap_connection_expire_timeout {
    validate_integer($ldap_connection_expire_timeout, '', 0)
  }
  if $ldap_page_size {
    validate_integer($ldap_page_size, '', 0)
  }
  if $ldap_disable_paging {
    validate_bool($ldap_disable_paging)
  }
  if $ldap_disable_range_retrieval {
    validate_bool($ldap_disable_range_retrieval)
  }
  if $ldap_sasl_minssf {
    validate_integer($ldap_sasl_minssf, '', 0)
  }
  if $ldap_deref_threshold {
    validate_integer($ldap_deref_threshold, '', 0)
  }
  if $ldap_tls_reqcert {
    validate_re($ldap_tls_reqcert, '^(never|allow|try|demand|hard)$')
  }
  if $ldap_tls_cacert {
    validate_absolute_path($ldap_tls_cacert)
  }
  if $ldap_tls_cacertdir {
    validate_absolute_path($ldap_tls_cacertdir)
  }
  if $ldap_tls_cert {
    validate_absolute_path($ldap_tls_cert)
  }
  if $ldap_tls_key {
    validate_absolute_path($ldap_tls_key)
  }
  validate_string($ldap_tls_cipher_suite)
  if $ldap_id_use_start_tls {
    validate_bool($ldap_id_use_start_tls)
  }
  if $ldap_id_mapping {
    validate_bool($ldap_id_mapping)
  }
  if $ldap_idmap_range_min {
    validate_integer($ldap_idmap_range_min, '', 0)
  }
  if $ldap_idmap_range_max {
    validate_integer($ldap_idmap_range_max, '', 0)
  }
  if $ldap_idmap_range_size {
    validate_integer($ldap_idmap_range_size, '', 0)
  }
  validate_string($ldap_idmap_default_domain_sid)
  validate_string($ldap_idmap_default_domain)
  if $ldap_idmap_autorid_compat {
    validate_bool($ldap_idmap_autorid_compat)
  }
  if $ldap_max_id {
    validate_integer($ldap_max_id, '', 0)
  }
  if $ldap_min_id {
    validate_integer($ldap_min_id, '', 0)
  }
  validate_string($ldap_sasl_mech)
  validate_string($ldap_sasl_authid)
  validate_string($ldap_sasl_realm)
  if $ldap_sasl_canonicalize {
    validate_bool($ldap_sasl_canonicalize)
  }
  if $ldap_krb5_keytab {
    validate_absolute_path($ldap_krb5_keytab)
  }
  if $ldap_krb5_init_creds {
    validate_bool($ldap_krb5_init_creds)
  }
  if $ldap_krb5_ticket_lifetime {
    validate_integer($ldap_krb5_ticket_lifetime, '', 0)
  }
  if $ldap_pwd_policy {
    validate_re($ldap_pwd_policy, '^(none|shadow|mit_kerberos)$')
  }
  if $ldap_referrals {
    validate_bool($ldap_referrals)
  }
  validate_string($ldap_dns_service_name)
  validate_string($ldap_chpass_dns_service_name)
  if $ldap_chpass_update_last_change {
    validate_bool($ldap_chpass_update_last_change)
  }
  validate_string($ldap_access_filter)
  if $ldap_account_expire_policy {
    validate_re($ldap_account_expire_policy, '^(shadow|ad|rhds|ipa|389ds|nds)$')
  }
  if $ldap_access_order {
    validate_array($ldap_access_order)
  }
  validate_string($ldap_pwdlockout_dn)
  if $ldap_deref {
    validate_re($ldap_deref, '^(never|searching|finding|always)$')
  }
  if $ldap_rfc2307_fallback_to_local_users {
    validate_bool($ldap_rfc2307_fallback_to_local_users)
  }
  validate_string($ldap_sudorule_object_class)
  validate_string($ldap_sudorule_name)
  validate_string($ldap_sudorule_command)
  validate_string($ldap_sudorule_host)
  validate_string($ldap_sudorule_user)
  validate_string($ldap_sudorule_option)
  validate_string($ldap_sudorule_runasuser)
  validate_string($ldap_sudorule_runasgroup)
  validate_string($ldap_sudorule_notbefore)
  validate_string($ldap_sudorule_notafter)
  validate_string($ldap_sudorule_order)
  if $ldap_sudo_full_refresh_interval {
    validate_integer($ldap_sudo_full_refresh_interval, '', 0)
  }
  if $ldap_sudo_smart_refresh_interval {
    validate_integer($ldap_sudo_smart_refresh_interval, '', 0)
  }
  if $ldap_sudo_use_host_filter {
    validate_bool($ldap_sudo_use_host_filter)
  }
  if $ldap_sudo_hostnames {
    validate_array($ldap_sudo_hostnames)
  }
  if $ldap_sudo_ip {
    validate_array($ldap_sudo_ip)
  }
  if $ldap_sudo_include_netgroups {
    validate_bool($ldap_sudo_include_netgroups)
  }
  if $ldap_sudo_include_regexp {
    validate_bool($ldap_sudo_include_regexp)
  }
  validate_string($ldap_autofs_map_master_name)
  validate_string($ldap_autofs_map_object_class)
  validate_string($ldap_autofs_map_name)
  validate_string($ldap_autofs_entry_object_class)
  validate_string($ldap_autofs_entry_key)
  validate_string($ldap_autofs_entry_value)
  validate_string($ldap_netgroup_search_base)
  validate_string($ldap_user_search_base)
  validate_string($ldap_group_search_base)
  validate_string($ldap_sudo_search_base)
  validate_string($ldap_autofs_search_base)
  if $krb5_server {
    validate_array($krb5_server)
  }
  if $krb5_backup_server {
    validate_array($krb5_backup_server)
  }
  validate_string($krb5_realm)
  if $krb5_kpasswd {
    validate_array($krb5_kpasswd)
  }
  if $krb5_backup_kpasswd {
    validate_array($krb5_backup_kpasswd)
  }
  if $krb5_ccachedir {
    validate_absolute_path($krb5_ccachedir)
  }
  validate_string($krb5_ccname_template)
  if $krb5_auth_timeout {
    validate_integer($krb5_auth_timeout, '', 0)
  }
  if $krb5_validate {
    validate_bool($krb5_validate)
  }
  if $krb5_keytab {
    validate_absolute_path($krb5_keytab)
  }
  if $krb5_store_password_if_offline {
    validate_bool($krb5_store_password_if_offline)
  }
  if $krb5_renewable_lifetime {
    validate_re($krb5_renewable_lifetime, '^\d+[smhd]?$')
  }
  if $krb5_lifetime {
    validate_re($krb5_lifetime, '^\d+[smhd]?$')
  }
  if $krb5_renew_interval {
    validate_re($krb5_renew_interval, '^\d+[smhd]?$')
  }
  if $krb5_use_fast {
    validate_re($krb5_use_fast, '^(never|try|demand)$')
  }
  validate_string($krb5_fast_principal)
  if $krb5_canonicalize {
    validate_bool($krb5_canonicalize)
  }
  if $krb5_use_kdcinfo {
    validate_bool($krb5_use_kdcinfo)
  }
  if $krb5_use_enterprise_principal {
    validate_bool($krb5_use_enterprise_principal)
  }
  if $krb5_map_user {
    validate_array($krb5_map_user)
  }
  if $krb5_confd_path {
    validate_absolute_path($krb5_confd_path)
  }
  validate_string($ad_domain)
  if $ad_server {
    validate_array($ad_server)
  }
  if $ad_backup_server {
    validate_array($ad_backup_server)
  }
  validate_string($ad_hostname)
  if $ad_enable_dns_sites {
    validate_bool($ad_enable_dns_sites)
  }
  validate_string($ad_access_filter)
  validate_string($ad_site)
  if $ad_enable_gc {
    validate_bool($ad_enable_gc)
  }
  if $ad_gpo_access_control {
    validate_re($ad_gpo_access_control, '^(disabled|enforcing|permissive)$')
  }
  if $ad_gpo_cache_timeout {
    validate_integer($ad_gpo_cache_timeout, '', 0)
  }
  if $ad_gpo_map_interactive {
    validate_array($ad_gpo_map_interactive)
  }
  if $ad_gpo_map_remote_interactive {
    validate_array($ad_gpo_map_remote_interactive)
  }
  if $ad_gpo_map_network {
    validate_array($ad_gpo_map_network)
  }
  if $ad_gpo_map_batch {
    validate_array($ad_gpo_map_batch)
  }
  if $ad_gpo_map_service {
    validate_array($ad_gpo_map_service)
  }
  if $ad_gpo_map_permit {
    validate_array($ad_gpo_map_permit)
  }
  if $ad_gpo_map_deny {
    validate_array($ad_gpo_map_deny)
  }
  if $ad_gpo_default_right {
    validate_re($ad_gpo_default_right, '^((remote_)?interactive|network|batch|service|permit|deny)$')
  }
  validate_string($ipa_domain)
  if $ipa_server {
    validate_array($ipa_server)
  }
  if $ipa_backup_server {
    validate_array($ipa_backup_server)
  }
  validate_string($ipa_hostname)
  if $ipa_enable_dns_sites {
    validate_bool($ipa_enable_dns_sites)
  }
  validate_string($ipa_hbac_search_base)
  validate_string($ipa_host_search_base)
  validate_string($ipa_selinux_search_base)
  validate_string($ipa_subdomains_search_base)
  validate_string($ipa_master_domain_search_base)
  validate_string($ipa_views_search_base)
  if $ipa_hbac_refresh {
    validate_integer($ipa_hbac_refresh, '', 0)
  }
  if $ipa_hbac_selinux {
    validate_integer($ipa_hbac_selinux, '', 0)
  }
  if $ipa_server_mode {
    validate_bool($ipa_server_mode)
  }
  validate_string($ipa_automount_location)
  validate_string($ipa_view_class)
  validate_string($ipa_view_name)
  validate_string($ipa_override_object_class)
  validate_string($ipa_anchor_uuid)
  validate_string($ipa_user_override_object_class)
  validate_string($ipa_group_override_object_class)

  $config = delete_undef_values({
    'id_provider'                                   => $id_provider,
    'debug_level'                                   => $debug_level,
    'debug_timestamps'                              => $debug_timestamps,
    'debug_microseconds'                            => $debug_microseconds,
    'timeout'                                       => $timeout,
    'max_id'                                        => $max_id,
    'min_id'                                        => $min_id,
    'enumerate'                                     => $enumerate,
    'subdomain_enumerate'                           => $subdomain_enumerate ? {
      undef   => undef,
      default => join($subdomain_enumerate, ', '),
    },
    'force_timeout'                                 => $force_timeout,
    'entry_cache_timeout'                           => $entry_cache_timeout,
    'entry_cache_user_timeout'                      => $entry_cache_user_timeout,
    'entry_cache_group_timeout'                     => $entry_cache_group_timeout,
    'entry_cache_netgroup_timeout'                  => $entry_cache_netgroup_timeout,
    'entry_cache_service_timeout'                   => $entry_cache_service_timeout,
    'entry_cache_sudo_timeout'                      => $entry_cache_sudo_timeout,
    'entry_cache_autofs_timeout'                    => $entry_cache_autofs_timeout,
    'entry_cache_ssh_host_timeout'                  => $entry_cache_ssh_host_timeout,
    'refresh_expired_interval'                      => $refresh_expired_interval,
    'cache_credentials'                             => $cache_credentials,
    'cache_credentials_minimal_first_factor_length' => $cache_credentials_minimal_first_factor_length,
    'account_cache_expiration'                      => $account_cache_expiration,
    'pwd_expiration_warning'                        => $pwd_expiration_warning,
    'use_fully_qualified_names'                     => $use_fully_qualified_names,
    'ignore_group_members'                          => $ignore_group_members,
    'auth_provider'                                 => $auth_provider,
    'access_provider'                               => $access_provider,
    'chpass_provider'                               => $chpass_provider,
    'sudo_provider'                                 => $sudo_provider,
    'selinux_provider'                              => $selinux_provider,
    'subdomains_provider'                           => $subdomains_provider,
    'autofs_provider'                               => $autofs_provider,
    'hostid_provider'                               => $hostid_provider,
    're_expression'                                 => $re_expression,
    'full_name_format'                              => $full_name_format,
    'lookup_family_order'                           => $lookup_family_order,
    'dns_resolver_timeout'                          => $dns_resolver_timeout,
    'dns_discovery_domain'                          => $dns_discovery_domain,
    'override_gid'                                  => $override_gid,
    'case_sensitive'                                => $case_sensitive,
    'proxy_fast_alias'                              => $proxy_fast_alias,
    'subdomain_homedir'                             => $subdomain_homedir,
    'realmd_tags'                                   => $realmd_tags ? {
      undef   => undef,
      default => join($realmd_tags, ' '),
    },
    'cached_auth_timeout'                           => $cached_auth_timeout,
    'dyndns_update'                                 => $dyndns_update,
    'dyndns_ttl'                                    => $dyndns_ttl,
    'dyndns_iface'                                  => $dyndns_iface,
    'dyndns_refresh_interval'                       => $dyndns_refresh_interval,
    'dyndns_update_ptr'                             => $dyndns_update_ptr,
    'dyndns_force_tcp'                              => $dyndns_force_tcp,
    'dyndns_server'                                 => $dyndns_server,
    'override_homedir'                              => $override_homedir,
    'homedir_substring'                             => $homedir_substring,
    'wildcard_limit'                                => $wildcard_limit,
    'simple_allow_users'                            => $simple_allow_users ? {
      undef   => undef,
      default => join($simple_allow_users, ', '),
    },
    'simple_deny_users'                             => $simple_deny_users ? {
      undef   => undef,
      default => join($simple_deny_users, ', '),
    },
    'simple_allow_groups'                           => $simple_allow_groups ? {
      undef   => undef,
      default => join($simple_allow_groups, ', '),
    },
    'simple_deny_groups'                            => $simple_deny_groups ? {
      undef   => undef,
      default => join($simple_deny_groups, ', '),
    },
    'proxy_pam_target'                              => $proxy_pam_target,
    'proxy_lib_name'                                => $proxy_lib_name,
    'default_shell'                                 => $default_shell,
    'base_directory'                                => $base_directory,
    'create_homedir'                                => $create_homedir,
    'remove_homedir'                                => $remove_homedir,
    'homedir_umask'                                 => $homedir_umask,
    'skel_dir'                                      => $skel_dir,
    'mail_dir'                                      => $mail_dir,
    'userdel_cmd'                                   => $userdel_cmd,
    'ldap_uri'                                      => $ldap_uri ? {
      undef   => undef,
      default => join($ldap_uri, ', '),
    },
    'ldap_backup_uri'                               => $ldap_backup_uri ? {
      undef   => undef,
      default => join($ldap_backup_uri, ', '),
    },
    'ldap_chpass_uri'                               => $ldap_chpass_uri ? {
      undef   => undef,
      default => join($ldap_chpass_uri, ', '),
    },
    'ldap_chpass_backup_uri'                        => $ldap_chpass_backup_uri ? {
      undef   => undef,
      default => join($ldap_chpass_backup_uri, ', '),
    },
    'ldap_search_base'                              => $ldap_search_base,
    'ldap_schema'                                   => $ldap_schema,
    'ldap_default_bind_dn'                          => $ldap_default_bind_dn,
    'ldap_default_authtok_type'                     => $ldap_default_authtok_type,
    'ldap_default_authtok'                          => $ldap_default_authtok,
    'ldap_user_object_class'                        => $ldap_user_object_class,
    'ldap_user_name'                                => $ldap_user_name,
    'ldap_user_uid_number'                          => $ldap_user_uid_number,
    'ldap_user_gid_number'                          => $ldap_user_gid_number,
    'ldap_user_gecos'                               => $ldap_user_gecos,
    'ldap_user_home_directory'                      => $ldap_user_home_directory,
    'ldap_user_shell'                               => $ldap_user_shell,
    'ldap_user_uuid'                                => $ldap_user_uuid,
    'ldap_user_objectsid'                           => $ldap_user_objectsid,
    'ldap_user_modify_timestamp'                    => $ldap_user_modify_timestamp,
    'ldap_user_shadow_last_change'                  => $ldap_user_shadow_last_change,
    'ldap_user_shadow_min'                          => $ldap_user_shadow_min,
    'ldap_user_shadow_max'                          => $ldap_user_shadow_max,
    'ldap_user_shadow_warning'                      => $ldap_user_shadow_warning,
    'ldap_user_shadow_inactive'                     => $ldap_user_shadow_inactive,
    'ldap_user_shadow_expire'                       => $ldap_user_shadow_expire,
    'ldap_user_krb_last_pwd_change'                 => $ldap_user_krb_last_pwd_change,
    'ldap_user_krb_password_expiration'             => $ldap_user_krb_password_expiration,
    'ldap_user_ad_account_expires'                  => $ldap_user_ad_account_expires,
    'ldap_user_ad_user_account_control'             => $ldap_user_ad_user_account_control,
    'ldap_ns_account_lock'                          => $ldap_ns_account_lock,
    'ldap_user_nds_login_disabled'                  => $ldap_user_nds_login_disabled,
    'ldap_user_nds_login_expiration_time'           => $ldap_user_nds_login_expiration_time,
    'ldap_user_nds_login_allowed_time_map'          => $ldap_user_nds_login_allowed_time_map,
    'ldap_user_principal'                           => $ldap_user_principal,
    'ldap_user_extra_attrs'                         => $ldap_user_extra_attrs ? {
      undef   => undef,
      default => join($ldap_user_extra_attrs, ', '),
    },
    'ldap_user_ssh_public_key'                      => $ldap_user_ssh_public_key,
    'ldap_force_upper_case_realm'                   => $ldap_force_upper_case_realm,
    'ldap_enumeration_refresh_timeout'              => $ldap_enumeration_refresh_timeout,
    'ldap_purge_cache_timeout'                      => $ldap_purge_cache_timeout,
    'ldap_user_fullname'                            => $ldap_user_fullname,
    'ldap_user_member_of'                           => $ldap_user_member_of,
    'ldap_user_authorized_service'                  => $ldap_user_authorized_service,
    'ldap_user_authorized_host'                     => $ldap_user_authorized_host,
    'ldap_user_certificate'                         => $ldap_user_certificate,
    'ldap_group_object_class'                       => $ldap_group_object_class,
    'ldap_group_name'                               => $ldap_group_name,
    'ldap_group_gid_number'                         => $ldap_group_gid_number,
    'ldap_group_member'                             => $ldap_group_member,
    'ldap_group_uuid'                               => $ldap_group_uuid,
    'ldap_group_objectsid'                          => $ldap_group_objectsid,
    'ldap_group_modify_timestamp'                   => $ldap_group_modify_timestamp,
    'ldap_group_type'                               => $ldap_group_type,
    'ldap_group_external_member'                    => $ldap_group_external_member,
    'ldap_group_nesting_level'                      => $ldap_group_nesting_level,
    'ldap_groups_use_matching_rule_in_chain'        => $ldap_groups_use_matching_rule_in_chain,
    'ldap_initgroups_use_matching_rule_in_chain'    => $ldap_initgroups_use_matching_rule_in_chain,
    'ldap_use_tokengroups'                          => $ldap_use_tokengroups,
    'ldap_netgroup_object_class'                    => $ldap_netgroup_object_class,
    'ldap_netgroup_name'                            => $ldap_netgroup_name,
    'ldap_netgroup_member'                          => $ldap_netgroup_member,
    'ldap_netgroup_triple'                          => $ldap_netgroup_triple,
    'ldap_netgroup_modify_timestamp'                => $ldap_netgroup_modify_timestamp,
    'ldap_service_object_class'                     => $ldap_service_object_class,
    'ldap_service_name'                             => $ldap_service_name,
    'ldap_service_port'                             => $ldap_service_port,
    'ldap_service_proto'                            => $ldap_service_proto,
    'ldap_service_search_base'                      => $ldap_service_search_base,
    'ldap_search_timeout'                           => $ldap_search_timeout,
    'ldap_enumeration_search_timeout'               => $ldap_enumeration_search_timeout,
    'ldap_network_timeout'                          => $ldap_network_timeout,
    'ldap_opt_timeout'                              => $ldap_opt_timeout,
    'ldap_connection_expire_timeout'                => $ldap_connection_expire_timeout,
    'ldap_page_size'                                => $ldap_page_size,
    'ldap_disable_paging'                           => $ldap_disable_paging,
    'ldap_disable_range_retrieval'                  => $ldap_disable_range_retrieval,
    'ldap_sasl_minssf'                              => $ldap_sasl_minssf,
    'ldap_deref_threshold'                          => $ldap_deref_threshold,
    'ldap_tls_reqcert'                              => $ldap_tls_reqcert,
    'ldap_tls_cacert'                               => $ldap_tls_cacert,
    'ldap_tls_cacertdir'                            => $ldap_tls_cacertdir,
    'ldap_tls_cert'                                 => $ldap_tls_cert,
    'ldap_tls_key'                                  => $ldap_tls_key,
    'ldap_tls_cipher_suite'                         => $ldap_tls_cipher_suite,
    'ldap_id_use_start_tls'                         => $ldap_id_use_start_tls,
    'ldap_id_mapping'                               => $ldap_id_mapping,
    'ldap_idmap_range_min'                          => $ldap_idmap_range_min,
    'ldap_idmap_range_max'                          => $ldap_idmap_range_max,
    'ldap_idmap_range_size'                         => $ldap_idmap_range_size,
    'ldap_idmap_default_domain_sid'                 => $ldap_idmap_default_domain_sid,
    'ldap_idmap_default_domain'                     => $ldap_idmap_default_domain,
    'ldap_idmap_autorid_compat'                     => $ldap_idmap_autorid_compat,
    'ldap_min_id'                                   => $ldap_min_id,
    'ldap_max_id'                                   => $ldap_max_id,
    'ldap_sasl_mech'                                => $ldap_sasl_mech,
    'ldap_sasl_authid'                              => $ldap_sasl_authid,
    'ldap_sasl_realm'                               => $ldap_sasl_realm,
    'ldap_sasl_canonicalize'                        => $ldap_sasl_canonicalize,
    'ldap_krb5_keytab'                              => $ldap_krb5_keytab,
    'ldap_krb5_init_creds'                          => $ldap_krb5_init_creds,
    'ldap_krb5_ticket_lifetime'                     => $ldap_krb5_ticket_lifetime,
    'ldap_pwd_policy'                               => $ldap_pwd_policy,
    'ldap_referrals'                                => $ldap_referrals,
    'ldap_dns_service_name'                         => $ldap_dns_service_name,
    'ldap_chpass_dns_service_name'                  => $ldap_chpass_dns_service_name,
    'ldap_chpass_update_last_change'                => $ldap_chpass_update_last_change,
    'ldap_access_filter'                            => $ldap_access_filter,
    'ldap_account_expire_policy'                    => $ldap_account_expire_policy,
    'ldap_access_order'                             => $ldap_access_order ? {
      undef   => undef,
      default => join($ldap_access_order, ', '),
    },
    'ldap_pwdlockout_dn'                            => $ldap_pwdlockout_dn,
    'ldap_deref'                                    => $ldap_deref,
    'ldap_rfc2307_fallback_to_local_users'          => $ldap_rfc2307_fallback_to_local_users,
    'ldap_sudorule_object_class'                    => $ldap_sudorule_object_class,
    'ldap_sudorule_name'                            => $ldap_sudorule_name,
    'ldap_sudorule_command'                         => $ldap_sudorule_command,
    'ldap_sudorule_host'                            => $ldap_sudorule_host,
    'ldap_sudorule_user'                            => $ldap_sudorule_user,
    'ldap_sudorule_option'                          => $ldap_sudorule_option,
    'ldap_sudorule_runasuser'                       => $ldap_sudorule_runasuser,
    'ldap_sudorule_runasgroup'                      => $ldap_sudorule_runasgroup,
    'ldap_sudorule_notbefore'                       => $ldap_sudorule_notbefore,
    'ldap_sudorule_notafter'                        => $ldap_sudorule_notafter,
    'ldap_sudorule_order'                           => $ldap_sudorule_order,
    'ldap_sudo_full_refresh_interval'               => $ldap_sudo_full_refresh_interval,
    'ldap_sudo_smart_refresh_interval'              => $ldap_sudo_smart_refresh_interval,
    'ldap_sudo_use_host_filter'                     => $ldap_sudo_use_host_filter,
    'ldap_sudo_hostnames'                           => $ldap_sudo_hostnames ? {
      undef   => undef,
      default => join($ldap_sudo_hostnames, ' '),
    },
    'ldap_sudo_ip'                                  => $ldap_sudo_ip ? {
      undef   => undef,
      default => join($ldap_sudo_ip, ' '),
    },
    'ldap_sudo_include_netgroups'                   => $ldap_sudo_include_netgroups,
    'ldap_sudo_include_regexp'                      => $ldap_sudo_include_regexp,
    'ldap_autofs_map_master_name'                   => $ldap_autofs_map_master_name,
    'ldap_autofs_map_object_class'                  => $ldap_autofs_map_object_class,
    'ldap_autofs_map_name'                          => $ldap_autofs_map_name,
    'ldap_autofs_entry_object_class'                => $ldap_autofs_entry_object_class,
    'ldap_autofs_entry_key'                         => $ldap_autofs_entry_key,
    'ldap_autofs_entry_value'                       => $ldap_autofs_entry_value,
    'ldap_netgroup_search_base'                     => $ldap_netgroup_search_base,
    'ldap_user_search_base'                         => $ldap_user_search_base,
    'ldap_group_search_base'                        => $ldap_group_search_base,
    'ldap_sudo_search_base'                         => $ldap_sudo_search_base,
    'ldap_autofs_search_base'                       => $ldap_autofs_search_base,
    'krb5_server'                                   => $krb5_server ? {
      undef   => undef,
      default => join($krb5_server, ', '),
    },
    'krb5_backup_server'                            => $krb5_backup_server ? {
      undef   => undef,
      default => join($krb5_backup_server, ', '),
    },
    'krb5_realm'                                    => $krb5_realm,
    'krb5_canonicalize'                             => $krb5_canonicalize,
    'krb5_use_kdcinfo'                              => $krb5_use_kdcinfo,
    'krb5_kpasswd'                                  => $krb5_kpasswd ? {
      undef   => undef,
      default => join($krb5_kpasswd, ', '),
    },
    'krb5_backup_kpasswd'                           => $krb5_backup_kpasswd ? {
      undef   => undef,
      default => join($krb5_backup_kpasswd, ', '),
    },
    'krb5_ccachedir'                                => $krb5_ccachedir,
    'krb5_ccname_template'                          => $krb5_ccname_template,
    'krb5_auth_timeout'                             => $krb5_auth_timeout,
    'krb5_validate'                                 => $krb5_validate,
    'krb5_keytab'                                   => $krb5_keytab,
    'krb5_store_password_if_offline'                => $krb5_store_password_if_offline,
    'krb5_renewable_lifetime'                       => $krb5_renewable_lifetime,
    'krb5_lifetime'                                 => $krb5_lifetime,
    'krb5_renew_interval'                           => $krb5_renew_interval,
    'krb5_use_fast'                                 => $krb5_use_fast,
    'krb5_fast_principal'                           => $krb5_fast_principal,
    'krb5_use_enterprise_principal'                 => $krb5_use_enterprise_principal,
    'krb5_map_user'                                 => $krb5_map_user ? {
      undef   => undef,
      default => join($krb5_map_user, ', '),
    },
    'krb5_confd_path'                               => $krb5_confd_path,
    'ad_domain'                                     => $ad_domain,
    'ad_server'                                     => $ad_server ? {
      undef   => undef,
      default => join($ad_server, ', '),
    },
    'ad_backup_server'                              => $ad_backup_server ? {
      undef   => undef,
      default => join($ad_backup_server, ', '),
    },
    'ad_hostname'                                   => $ad_hostname,
    'ad_enable_dns_sites'                           => $ad_enable_dns_sites,
    'ad_access_filter'                              => $ad_access_filter,
    'ad_site'                                       => $ad_site,
    'ad_enable_gc'                                  => $ad_enable_gc,
    'ad_gpo_access_control'                         => $ad_gpo_access_control,
    'ad_gpo_cache_timeout'                          => $ad_gpo_cache_timeout,
    'ad_gpo_map_interactive'                        => $ad_gpo_map_interactive ? {
      undef   => undef,
      default => join($ad_gpo_map_interactive, ', '),
    },
    'ad_gpo_map_remote_interactive'                 => $ad_gpo_map_remote_interactive ? {
      undef   => undef,
      default => join($ad_gpo_map_remote_interactive, ', '),
    },
    'ad_gpo_map_network'                            => $ad_gpo_map_network ? {
      undef   => undef,
      default => join($ad_gpo_map_network, ', '),
    },
    'ad_gpo_map_batch'                              => $ad_gpo_map_batch ? {
      undef   => undef,
      default => join($ad_gpo_map_batch, ', '),
    },
    'ad_gpo_map_service'                            => $ad_gpo_map_service ? {
      undef   => undef,
      default => join($ad_gpo_map_service, ', '),
    },
    'ad_gpo_map_permit'                             => $ad_gpo_map_permit ? {
      undef   => undef,
      default => join($ad_gpo_map_permit, ', '),
    },
    'ad_gpo_map_deny'                               => $ad_gpo_map_deny ? {
      undef   => undef,
      default => join($ad_gpo_map_deny, ', '),
    },
    'ad_gpo_default_right'                          => $ad_gpo_default_right,
    'ipa_domain'                                    => $ipa_domain,
    'ipa_server'                                    => $ipa_server ? {
      undef   => undef,
      default => join($ipa_server, ', '),
    },
    'ipa_backup_server'                             => $ipa_backup_server ? {
      undef   => undef,
      default => join($ipa_backup_server, ', '),
    },
    'ipa_hostname'                                  => $ipa_hostname,
    'ipa_enable_dns_sites'                          => $ipa_enable_dns_sites,
    'ipa_hbac_search_base'                          => $ipa_hbac_search_base,
    'ipa_host_search_base'                          => $ipa_host_search_base,
    'ipa_selinux_search_base'                       => $ipa_selinux_search_base,
    'ipa_subdomains_search_base'                    => $ipa_subdomains_search_base,
    'ipa_master_domain_search_base'                 => $ipa_master_domain_search_base,
    'ipa_views_search_base'                         => $ipa_views_search_base,
    'ipa_hbac_refresh'                              => $ipa_hbac_refresh,
    'ipa_hbac_selinux'                              => $ipa_hbac_selinux,
    'ipa_server_mode'                               => $ipa_server_mode,
    'ipa_automount_location'                        => $ipa_automount_location,
    'ipa_view_class'                                => $ipa_view_class,
    'ipa_view_name'                                 => $ipa_view_name,
    'ipa_override_object_class'                     => $ipa_override_object_class,
    'ipa_anchor_uuid'                               => $ipa_anchor_uuid,
    'ipa_user_override_object_class'                => $ipa_user_override_object_class,
    'ipa_group_override_object_class'               => $ipa_group_override_object_class,
  })

  $titles = prefix(keys($config), "domain/${name}/")
  $values = parsejson(inline_template('<%= @config.values.map { |x| { "value" => x } }.to_json %>'))

  Sssd_conf {
    target  => $::sssd::conf_file,
    require => File[$::sssd::conf_file],
    notify  => Class['::sssd::daemon']
  }

  create_resources(sssd_conf, hash(zip($titles, $values)), {'ensure' => 'present'})

  datacat_fragment { "sssd domain ${name}":
    target => 'sssd domains',
    data   => {
      'domain' => [$name],
    },
  }
}
