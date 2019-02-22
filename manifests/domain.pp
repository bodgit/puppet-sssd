# Define an SSSD domain.
#
# @example Define an LDAP domain
#   include ::sssd
#   ::sssd::domain { 'example.com':
#     id_provider           => 'ldap',
#     ldap_schema           => 'rfc2307',
#     ldap_uri              => ['ldap://192.0.2.1'],
#     ldap_search_base      => 'dc=example,dc=com',
#     ldap_tls_reqcert      => 'never',
#     ldap_id_use_start_tls => false,
#     ldap_default_bind_dn  => 'cn=Manager,dc=example,dc=com',
#     ldap_default_authtok  => 'secret',
#   }
#
# @param id_provider
# @param domain
# @param debug
# @param debug_level
# @param debug_timestamps
# @param debug_microseconds
# @param timeout
# @param domain_type
# @param max_id
# @param min_id
# @param enumerate
# @param subdomain_enumerate
# @param entry_cache_timeout
# @param entry_cache_user_timeout
# @param entry_cache_group_timeout
# @param entry_cache_netgroup_timeout
# @param entry_cache_service_timeout
# @param entry_cache_sudo_timeout
# @param entry_cache_autofs_timeout
# @param entry_cache_ssh_host_timeout
# @param refresh_expired_interval
# @param cache_credentials
# @param cache_credentials_minimal_first_factor_length
# @param account_cache_expiration
# @param pwd_expiration_warning
# @param use_fully_qualified_names
# @param ignore_group_members
# @param auth_provider
# @param access_provider
# @param chpass_provider
# @param sudo_provider
# @param selinux_provider
# @param subdomains_provider
# @param autofs_provider
# @param hostid_provider
# @param re_expression
# @param full_name_format
# @param lookup_family_order
# @param dns_resolver_timeout
# @param dns_discovery_domain
# @param override_gid
# @param case_sensitive
# @param subdomain_inherit
# @param subdomain_homedir
# @param realmd_tags
# @param cached_auth_timeout
# @param dyndns_update
# @param dyndns_ttl
# @param dyndns_iface
# @param dyndns_refresh_interval
# @param dyndns_update_ptr
# @param dyndns_force_tcp
# @param dyndns_auth
# @param dyndns_server
# @param override_homedir
# @param homedir_substring
# @param wildcard_limit
# @param simple_allow_users
# @param simple_deny_users
# @param simple_allow_groups
# @param simple_deny_groups
# @param proxy_pam_target
# @param proxy_lib_name
# @param proxy_fast_alias
# @param proxy_max_children
# @param default_shell
# @param base_directory
# @param create_homedir
# @param remove_homedir
# @param homedir_umask
# @param skel_dir
# @param mail_dir
# @param userdel_cmd
# @param ldap_uri
# @param ldap_backup_uri
# @param ldap_chpass_uri
# @param ldap_chpass_backup_uri
# @param ldap_search_base
# @param ldap_schema
# @param ldap_default_bind_dn
# @param ldap_default_authtok_type
# @param ldap_default_authtok
# @param ldap_user_object_class
# @param ldap_user_name
# @param ldap_user_uid_number
# @param ldap_user_gid_number
# @param ldap_user_gecos
# @param ldap_user_home_directory
# @param ldap_user_shell
# @param ldap_user_uuid
# @param ldap_user_objectsid
# @param ldap_user_modify_timestamp
# @param ldap_user_shadow_last_change
# @param ldap_user_shadow_min
# @param ldap_user_shadow_max
# @param ldap_user_shadow_warning
# @param ldap_user_shadow_inactive
# @param ldap_user_shadow_expire
# @param ldap_user_krb_last_pwd_change
# @param ldap_user_krb_password_expiration
# @param ldap_user_ad_account_expires
# @param ldap_user_ad_user_account_control
# @param ldap_ns_account_lock
# @param ldap_user_nds_login_disabled
# @param ldap_user_nds_login_expiration_time
# @param ldap_user_nds_login_allowed_time_map
# @param ldap_user_principal
# @param ldap_user_extra_attrs
# @param ldap_user_ssh_public_key
# @param ldap_force_upper_case_realm
# @param ldap_enumeration_refresh_timeout
# @param ldap_purge_cache_timeout
# @param ldap_user_fullname
# @param ldap_user_member_of
# @param ldap_user_authorized_service
# @param ldap_user_authorized_host
# @param ldap_user_certificate
# @param ldap_group_object_class
# @param ldap_group_name
# @param ldap_group_gid_number
# @param ldap_group_member
# @param ldap_group_uuid
# @param ldap_group_objectsid
# @param ldap_group_modify_timestamp
# @param ldap_group_type
# @param ldap_group_external_member
# @param ldap_group_nesting_level
# @param ldap_groups_use_matching_rule_in_chain
# @param ldap_initgroups_use_matching_rule_in_chain
# @param ldap_use_tokengroups
# @param ldap_netgroup_object_class
# @param ldap_netgroup_name
# @param ldap_netgroup_member
# @param ldap_netgroup_triple
# @param ldap_netgroup_modify_timestamp
# @param ldap_service_object_class
# @param ldap_service_name
# @param ldap_service_port
# @param ldap_service_proto
# @param ldap_service_search_base
# @param ldap_search_timeout
# @param ldap_enumeration_search_timeout
# @param ldap_network_timeout
# @param ldap_opt_timeout
# @param ldap_connection_expire_timeout
# @param ldap_page_size
# @param ldap_disable_paging
# @param ldap_disable_range_retrieval
# @param ldap_sasl_minssf
# @param ldap_deref_threshold
# @param ldap_tls_reqcert
# @param ldap_tls_cacert
# @param ldap_tls_cacertdir
# @param ldap_tls_cert
# @param ldap_tls_key
# @param ldap_tls_cipher_suite
# @param ldap_auth_disable_tls_never_use_in_production
# @param ldap_id_use_start_tls
# @param ldap_id_mapping
# @param ldap_idmap_range_min
# @param ldap_idmap_range_max
# @param ldap_idmap_range_size
# @param ldap_idmap_default_domain_sid
# @param ldap_idmap_default_domain
# @param ldap_idmap_autorid_compat
# @param ldap_idmap_helper_table_size
# @param ldap_max_id
# @param ldap_min_id
# @param ldap_sasl_mech
# @param ldap_sasl_authid
# @param ldap_sasl_realm
# @param ldap_sasl_canonicalize
# @param ldap_krb5_keytab
# @param ldap_krb5_init_creds
# @param ldap_krb5_ticket_lifetime
# @param ldap_pwd_policy
# @param ldap_referrals
# @param ldap_dns_service_name
# @param ldap_chpass_dns_service_name
# @param ldap_chpass_update_last_change
# @param ldap_access_filter
# @param ldap_account_expire_policy
# @param ldap_access_order
# @param ldap_pwdlockout_dn
# @param ldap_deref
# @param ldap_rfc2307_fallback_to_local_users
# @param ldap_sudorule_object_class
# @param ldap_sudorule_name
# @param ldap_sudorule_command
# @param ldap_sudorule_host
# @param ldap_sudorule_user
# @param ldap_sudorule_option
# @param ldap_sudorule_runasuser
# @param ldap_sudorule_runasgroup
# @param ldap_sudorule_notbefore
# @param ldap_sudorule_notafter
# @param ldap_sudorule_order
# @param ldap_sudo_full_refresh_interval
# @param ldap_sudo_smart_refresh_interval
# @param ldap_sudo_use_host_filter
# @param ldap_sudo_hostnames
# @param ldap_sudo_ip
# @param ldap_sudo_include_netgroups
# @param ldap_sudo_include_regexp
# @param ldap_autofs_map_master_name
# @param ldap_autofs_map_object_class
# @param ldap_autofs_map_name
# @param ldap_autofs_entry_object_class
# @param ldap_autofs_entry_key
# @param ldap_autofs_entry_value
# @param ldap_netgroup_search_base
# @param ldap_user_search_base
# @param ldap_group_search_base
# @param ldap_sudo_search_base
# @param ldap_autofs_search_base
# @param krb5_server
# @param krb5_backup_server
# @param krb5_realm
# @param krb5_kpasswd
# @param krb5_backup_kpasswd
# @param krb5_ccachedir
# @param krb5_ccname_template
# @param krb5_auth_timeout
# @param krb5_validate
# @param krb5_keytab
# @param krb5_store_password_if_offline
# @param krb5_renewable_lifetime
# @param krb5_lifetime
# @param krb5_renew_interval
# @param krb5_use_fast
# @param krb5_fast_principal
# @param krb5_canonicalize
# @param krb5_use_kdcinfo
# @param krb5_use_enterprise_principal
# @param krb5_map_user
# @param krb5_confd_path
# @param ad_domain
# @param ad_enabled_domains
# @param ad_server
# @param ad_backup_server
# @param ad_hostname
# @param ad_enable_dns_sites
# @param ad_access_filter
# @param ad_site
# @param ad_enable_gc
# @param ad_gpo_access_control
# @param ad_gpo_cache_timeout
# @param ad_gpo_map_interactive
# @param ad_gpo_map_remote_interactive
# @param ad_gpo_map_network
# @param ad_gpo_map_batch
# @param ad_gpo_map_service
# @param ad_gpo_map_permit
# @param ad_gpo_map_deny
# @param ad_gpo_default_right
# @param ad_maximum_machine_account_password_age
# @param ad_machine_account_password_renewal_opts
# @param ipa_domain
# @param ipa_server
# @param ipa_backup_server
# @param ipa_hostname
# @param ipa_enable_dns_sites
# @param ipa_hbac_search_base
# @param ipa_host_search_base
# @param ipa_selinux_search_base
# @param ipa_subdomains_search_base
# @param ipa_master_domain_search_base
# @param ipa_views_search_base
# @param ipa_hbac_refresh
# @param ipa_hbac_selinux
# @param ipa_server_mode
# @param ipa_automount_location
# @param ipa_view_class
# @param ipa_view_name
# @param ipa_override_object_class
# @param ipa_anchor_uuid
# @param ipa_user_override_object_class
# @param ipa_group_override_object_class
#
# @see puppet_classes::sssd ::sssd
#
# @since 1.0.0
define sssd::domain (
  SSSD::Provider::ID                                                                    $id_provider,
  String                                                                                $domain                                        = $title,
  # options for any section
  Optional[Integer[0]]                                                                  $debug                                         = undef,
  Optional[Integer[0]]                                                                  $debug_level                                   = undef,
  Optional[Boolean]                                                                     $debug_timestamps                              = undef,
  Optional[Boolean]                                                                     $debug_microseconds                            = undef,
  # generic domain options
  Optional[Integer[0]]                                                                  $timeout                                       = undef,
  Optional[Enum['posix', 'application']]                                                $domain_type                                   = undef,
  Optional[Integer[0]]                                                                  $max_id                                        = undef,
  Optional[Integer[0]]                                                                  $min_id                                        = undef,
  Optional[Boolean]                                                                     $enumerate                                     = undef,
  Optional[Array[String, 1]]                                                            $subdomain_enumerate                           = undef,
  Optional[Integer[0]]                                                                  $entry_cache_timeout                           = undef,
  Optional[Integer[0]]                                                                  $entry_cache_user_timeout                      = undef,
  Optional[Integer[0]]                                                                  $entry_cache_group_timeout                     = undef,
  Optional[Integer[0]]                                                                  $entry_cache_netgroup_timeout                  = undef,
  Optional[Integer[0]]                                                                  $entry_cache_service_timeout                   = undef,
  Optional[Integer[0]]                                                                  $entry_cache_sudo_timeout                      = undef,
  Optional[Integer[0]]                                                                  $entry_cache_autofs_timeout                    = undef,
  Optional[Integer[0]]                                                                  $entry_cache_ssh_host_timeout                  = undef,
  Optional[Integer[0]]                                                                  $refresh_expired_interval                      = undef,
  Optional[Boolean]                                                                     $cache_credentials                             = undef,
  Optional[Integer[0]]                                                                  $cache_credentials_minimal_first_factor_length = undef,
  Optional[Integer[0]]                                                                  $account_cache_expiration                      = undef,
  Optional[Integer[0]]                                                                  $pwd_expiration_warning                        = undef,
  Optional[Boolean]                                                                     $use_fully_qualified_names                     = undef,
  Optional[Boolean]                                                                     $ignore_group_members                          = undef,
  Optional[SSSD::Provider::Auth]                                                        $auth_provider                                 = undef,
  Optional[SSSD::Provider::Access]                                                      $access_provider                               = undef,
  Optional[SSSD::Provider::Chpass]                                                      $chpass_provider                               = undef,
  Optional[SSSD::Provider::Sudo]                                                        $sudo_provider                                 = undef,
  Optional[SSSD::Provider::SELinux]                                                     $selinux_provider                              = undef,
  Optional[SSSD::Provider::Subdomains]                                                  $subdomains_provider                           = undef,
  Optional[SSSD::Provider::AutoFS]                                                      $autofs_provider                               = undef,
  Optional[SSSD::Provider::HostID]                                                      $hostid_provider                               = undef,
  Optional[String]                                                                      $re_expression                                 = undef,
  Optional[String]                                                                      $full_name_format                              = undef,
  Optional[Enum['ipv4_first', 'ipv4_only', 'ipv6_first', 'ipv6_only']]                  $lookup_family_order                           = undef,
  Optional[Integer[0]]                                                                  $dns_resolver_timeout                          = undef,
  Optional[Bodgitlib::Domain]                                                           $dns_discovery_domain                          = undef,
  Optional[Integer[0]]                                                                  $override_gid                                  = undef,
  Optional[Variant[Boolean, Enum['preserving']]]                                        $case_sensitive                                = undef,
  Optional[Array[SSSD::Subdomain::Inherit, 1]]                                          $subdomain_inherit                             = undef,
  Optional[Stdlib::Absolutepath]                                                        $subdomain_homedir                             = undef,
  Optional[Array[String, 1]]                                                            $realmd_tags                                   = undef,
  Optional[Integer[0]]                                                                  $cached_auth_timeout                           = undef,
  Optional[Boolean]                                                                     $dyndns_update                                 = undef,
  Optional[Integer[0]]                                                                  $dyndns_ttl                                    = undef,
  Optional[Array[String, 1]]                                                            $dyndns_iface                                  = undef,
  Optional[Integer[0]]                                                                  $dyndns_refresh_interval                       = undef,
  Optional[Boolean]                                                                     $dyndns_update_ptr                             = undef,
  Optional[Boolean]                                                                     $dyndns_force_tcp                              = undef,
  Optional[String]                                                                      $dyndns_auth                                   = undef,
  Optional[Bodgitlib::Host]                                                             $dyndns_server                                 = undef,
  Optional[Stdlib::Absolutepath]                                                        $override_homedir                              = undef,
  Optional[Stdlib::Absolutepath]                                                        $homedir_substring                             = undef,
  Optional[Integer[0]]                                                                  $wildcard_limit                                = undef,
  # simple access provider
  Optional[Array[String, 1]]                                                            $simple_allow_users                            = undef,
  Optional[Array[String, 1]]                                                            $simple_deny_users                             = undef,
  Optional[Array[String, 1]]                                                            $simple_allow_groups                           = undef,
  Optional[Array[String, 1]]                                                            $simple_deny_groups                            = undef,
  # proxy
  Optional[String]                                                                      $proxy_pam_target                              = undef,
  Optional[String]                                                                      $proxy_lib_name                                = undef,
  Optional[Boolean]                                                                     $proxy_fast_alias                              = undef,
  Optional[Integer[0]]                                                                  $proxy_max_children                            = undef,
  # local
  Optional[Stdlib::Absolutepath]                                                        $default_shell                                 = undef,
  Optional[Stdlib::Absolutepath]                                                        $base_directory                                = undef,
  Optional[Boolean]                                                                     $create_homedir                                = undef,
  Optional[Boolean]                                                                     $remove_homedir                                = undef,
  Optional[Pattern[/^[0-7]{3}$/]]                                                       $homedir_umask                                 = undef,
  Optional[Stdlib::Absolutepath]                                                        $skel_dir                                      = undef,
  Optional[Stdlib::Absolutepath]                                                        $mail_dir                                      = undef,
  Optional[Stdlib::Absolutepath]                                                        $userdel_cmd                                   = undef,
  # ldap
  Optional[Array[Variant[Bodgitlib::LDAP::URI::Simple, Enum['_srv_']], 1]]              $ldap_uri                                      = undef,
  Optional[Array[Bodgitlib::LDAP::URI::Simple, 1]]                                      $ldap_backup_uri                               = undef,
  Optional[Array[Variant[Bodgitlib::LDAP::URI::Simple, Enum['_srv_']], 1]]              $ldap_chpass_uri                               = undef,
  Optional[Array[Bodgitlib::LDAP::URI::Simple, 1]]                                      $ldap_chpass_backup_uri                        = undef,
  Optional[SSSD::Search::Base]                                                          $ldap_search_base                              = undef,
  Optional[Enum['rfc2307', 'rfc2307bis', 'ipa', 'ad']]                                  $ldap_schema                                   = undef,
  Optional[Bodgitlib::LDAP::DN]                                                         $ldap_default_bind_dn                          = undef,
  Optional[Enum['password', 'obfuscated_password']]                                     $ldap_default_authtok_type                     = undef,
  Optional[String]                                                                      $ldap_default_authtok                          = undef,
  Optional[String]                                                                      $ldap_user_object_class                        = undef,
  Optional[String]                                                                      $ldap_user_name                                = undef,
  Optional[String]                                                                      $ldap_user_uid_number                          = undef,
  Optional[String]                                                                      $ldap_user_gid_number                          = undef,
  Optional[String]                                                                      $ldap_user_gecos                               = undef,
  Optional[String]                                                                      $ldap_user_home_directory                      = undef,
  Optional[String]                                                                      $ldap_user_shell                               = undef,
  Optional[String]                                                                      $ldap_user_uuid                                = undef,
  Optional[String]                                                                      $ldap_user_objectsid                           = undef,
  Optional[String]                                                                      $ldap_user_modify_timestamp                    = undef,
  Optional[String]                                                                      $ldap_user_shadow_last_change                  = undef,
  Optional[String]                                                                      $ldap_user_shadow_min                          = undef,
  Optional[String]                                                                      $ldap_user_shadow_max                          = undef,
  Optional[String]                                                                      $ldap_user_shadow_warning                      = undef,
  Optional[String]                                                                      $ldap_user_shadow_inactive                     = undef,
  Optional[String]                                                                      $ldap_user_shadow_expire                       = undef,
  Optional[String]                                                                      $ldap_user_krb_last_pwd_change                 = undef,
  Optional[String]                                                                      $ldap_user_krb_password_expiration             = undef,
  Optional[String]                                                                      $ldap_user_ad_account_expires                  = undef,
  Optional[String]                                                                      $ldap_user_ad_user_account_control             = undef,
  Optional[String]                                                                      $ldap_ns_account_lock                          = undef,
  Optional[String]                                                                      $ldap_user_nds_login_disabled                  = undef,
  Optional[String]                                                                      $ldap_user_nds_login_expiration_time           = undef,
  Optional[String]                                                                      $ldap_user_nds_login_allowed_time_map          = undef,
  Optional[String]                                                                      $ldap_user_principal                           = undef,
  Optional[Array[String, 1]]                                                            $ldap_user_extra_attrs                         = undef,
  Optional[String]                                                                      $ldap_user_ssh_public_key                      = undef,
  Optional[Boolean]                                                                     $ldap_force_upper_case_realm                   = undef,
  Optional[Integer[0]]                                                                  $ldap_enumeration_refresh_timeout              = undef,
  Optional[Integer[0]]                                                                  $ldap_purge_cache_timeout                      = undef,
  Optional[String]                                                                      $ldap_user_fullname                            = undef,
  Optional[String]                                                                      $ldap_user_member_of                           = undef,
  Optional[String]                                                                      $ldap_user_authorized_service                  = undef,
  Optional[String]                                                                      $ldap_user_authorized_host                     = undef,
  Optional[String]                                                                      $ldap_user_certificate                         = undef,
  Optional[String]                                                                      $ldap_group_object_class                       = undef,
  Optional[String]                                                                      $ldap_group_name                               = undef,
  Optional[String]                                                                      $ldap_group_gid_number                         = undef,
  Optional[String]                                                                      $ldap_group_member                             = undef,
  Optional[String]                                                                      $ldap_group_uuid                               = undef,
  Optional[String]                                                                      $ldap_group_objectsid                          = undef,
  Optional[String]                                                                      $ldap_group_modify_timestamp                   = undef,
  Optional[String]                                                                      $ldap_group_type                               = undef,
  Optional[String]                                                                      $ldap_group_external_member                    = undef,
  Optional[Integer[0]]                                                                  $ldap_group_nesting_level                      = undef,
  Optional[Boolean]                                                                     $ldap_groups_use_matching_rule_in_chain        = undef,
  Optional[Boolean]                                                                     $ldap_initgroups_use_matching_rule_in_chain    = undef,
  Optional[Boolean]                                                                     $ldap_use_tokengroups                          = undef,
  Optional[String]                                                                      $ldap_netgroup_object_class                    = undef,
  Optional[String]                                                                      $ldap_netgroup_name                            = undef,
  Optional[String]                                                                      $ldap_netgroup_member                          = undef,
  Optional[String]                                                                      $ldap_netgroup_triple                          = undef,
  Optional[String]                                                                      $ldap_netgroup_modify_timestamp                = undef,
  Optional[String]                                                                      $ldap_service_object_class                     = undef,
  Optional[String]                                                                      $ldap_service_name                             = undef,
  Optional[String]                                                                      $ldap_service_port                             = undef,
  Optional[String]                                                                      $ldap_service_proto                            = undef,
  Optional[SSSD::Search::Base]                                                          $ldap_service_search_base                      = undef,
  Optional[Integer[0]]                                                                  $ldap_search_timeout                           = undef,
  Optional[Integer[0]]                                                                  $ldap_enumeration_search_timeout               = undef,
  Optional[Integer[0]]                                                                  $ldap_network_timeout                          = undef,
  Optional[Integer[0]]                                                                  $ldap_opt_timeout                              = undef,
  Optional[Integer[0]]                                                                  $ldap_connection_expire_timeout                = undef,
  Optional[Integer[0]]                                                                  $ldap_page_size                                = undef,
  Optional[Boolean]                                                                     $ldap_disable_paging                           = undef,
  Optional[Boolean]                                                                     $ldap_disable_range_retrieval                  = undef,
  Optional[Integer[0]]                                                                  $ldap_sasl_minssf                              = undef,
  Optional[Integer[0]]                                                                  $ldap_deref_threshold                          = undef,
  Optional[Enum['never', 'allow', 'try', 'demand', 'hard']]                             $ldap_tls_reqcert                              = undef,
  Optional[Stdlib::Absolutepath]                                                        $ldap_tls_cacert                               = undef,
  Optional[Stdlib::Absolutepath]                                                        $ldap_tls_cacertdir                            = undef,
  Optional[Stdlib::Absolutepath]                                                        $ldap_tls_cert                                 = undef,
  Optional[Stdlib::Absolutepath]                                                        $ldap_tls_key                                  = undef,
  Optional[String]                                                                      $ldap_tls_cipher_suite                         = undef,
  Optional[Boolean]                                                                     $ldap_auth_disable_tls_never_use_in_production                         = undef,
  Optional[Boolean]                                                                     $ldap_id_use_start_tls                         = undef,
  Optional[Boolean]                                                                     $ldap_id_mapping                               = undef,
  Optional[Integer[0]]                                                                  $ldap_idmap_range_min                          = undef,
  Optional[Integer[0]]                                                                  $ldap_idmap_range_max                          = undef,
  Optional[Integer[0]]                                                                  $ldap_idmap_range_size                         = undef,
  Optional[String]                                                                      $ldap_idmap_default_domain_sid                 = undef,
  Optional[String]                                                                      $ldap_idmap_default_domain                     = undef,
  Optional[Boolean]                                                                     $ldap_idmap_autorid_compat                     = undef,
  Optional[Integer[0]]                                                                  $ldap_idmap_helper_table_size                  = undef,
  Optional[Integer[0]]                                                                  $ldap_max_id                                   = undef,
  Optional[Integer[0]]                                                                  $ldap_min_id                                   = undef,
  Optional[String]                                                                      $ldap_sasl_mech                                = undef,
  Optional[String]                                                                      $ldap_sasl_authid                              = undef,
  Optional[String]                                                                      $ldap_sasl_realm                               = undef,
  Optional[Boolean]                                                                     $ldap_sasl_canonicalize                        = undef,
  Optional[Stdlib::Absolutepath]                                                        $ldap_krb5_keytab                              = undef,
  Optional[Boolean]                                                                     $ldap_krb5_init_creds                          = undef,
  Optional[Integer[0]]                                                                  $ldap_krb5_ticket_lifetime                     = undef,
  Optional[Enum['none', 'shadow', 'mit_kerberos']]                                      $ldap_pwd_policy                               = undef,
  Optional[Boolean]                                                                     $ldap_referrals                                = undef,
  Optional[String]                                                                      $ldap_dns_service_name                         = undef,
  Optional[String]                                                                      $ldap_chpass_dns_service_name                  = undef,
  Optional[Boolean]                                                                     $ldap_chpass_update_last_change                = undef,
  Optional[Bodgitlib::LDAP::Filter]                                                     $ldap_access_filter                            = undef,
  Optional[Enum['shadow', 'ad', 'rhds', 'ipa', '389ds', 'nds']]                         $ldap_account_expire_policy                    = undef,
  Optional[Array[SSSD::LDAP::Access::Order, 1]]                                         $ldap_access_order                             = undef,
  Optional[Bodgitlib::LDAP::DN]                                                         $ldap_pwdlockout_dn                            = undef,
  Optional[Enum['never', 'searching', 'finding', 'always']]                             $ldap_deref                                    = undef,
  Optional[Boolean]                                                                     $ldap_rfc2307_fallback_to_local_users          = undef,
  Optional[String]                                                                      $ldap_sudorule_object_class                    = undef,
  Optional[String]                                                                      $ldap_sudorule_name                            = undef,
  Optional[String]                                                                      $ldap_sudorule_command                         = undef,
  Optional[String]                                                                      $ldap_sudorule_host                            = undef,
  Optional[String]                                                                      $ldap_sudorule_user                            = undef,
  Optional[String]                                                                      $ldap_sudorule_option                          = undef,
  Optional[String]                                                                      $ldap_sudorule_runasuser                       = undef,
  Optional[String]                                                                      $ldap_sudorule_runasgroup                      = undef,
  Optional[String]                                                                      $ldap_sudorule_notbefore                       = undef,
  Optional[String]                                                                      $ldap_sudorule_notafter                        = undef,
  Optional[String]                                                                      $ldap_sudorule_order                           = undef,
  Optional[Integer[0]]                                                                  $ldap_sudo_full_refresh_interval               = undef,
  Optional[Integer[0]]                                                                  $ldap_sudo_smart_refresh_interval              = undef,
  Optional[Boolean]                                                                     $ldap_sudo_use_host_filter                     = undef,
  Optional[Array[String, 1]]                                                            $ldap_sudo_hostnames                           = undef,
  Optional[Array[IP::Address, 1]]                                                       $ldap_sudo_ip                                  = undef,
  Optional[Boolean]                                                                     $ldap_sudo_include_netgroups                   = undef,
  Optional[Boolean]                                                                     $ldap_sudo_include_regexp                      = undef,
  Optional[String]                                                                      $ldap_autofs_map_master_name                   = undef,
  Optional[String]                                                                      $ldap_autofs_map_object_class                  = undef,
  Optional[String]                                                                      $ldap_autofs_map_name                          = undef,
  Optional[String]                                                                      $ldap_autofs_entry_object_class                = undef,
  Optional[String]                                                                      $ldap_autofs_entry_key                         = undef,
  Optional[String]                                                                      $ldap_autofs_entry_value                       = undef,
  Optional[SSSD::Search::Base]                                                          $ldap_netgroup_search_base                     = undef,
  Optional[SSSD::Search::Base]                                                          $ldap_user_search_base                         = undef,
  Optional[SSSD::Search::Base]                                                          $ldap_group_search_base                        = undef,
  Optional[SSSD::Search::Base]                                                          $ldap_sudo_search_base                         = undef,
  Optional[SSSD::Search::Base]                                                          $ldap_autofs_search_base                       = undef,
  # krb5
  Optional[Array[Variant[Bodgitlib::Host, Enum['_srv_']], 1]]                           $krb5_server                                   = undef,
  Optional[Array[Bodgitlib::Host, 1]]                                                   $krb5_backup_server                            = undef,
  Optional[String]                                                                      $krb5_realm                                    = undef,
  # It's not clear if krb5_kpasswd should also accept the magic '_srv_' value
  Optional[Array[Variant[Bodgitlib::Host, Tuple[Bodgitlib::Host, Bodgitlib::Port]], 1]] $krb5_kpasswd                                  = undef,
  Optional[Array[Variant[Bodgitlib::Host, Tuple[Bodgitlib::Host, Bodgitlib::Port]], 1]] $krb5_backup_kpasswd                           = undef,
  Optional[Stdlib::Absolutepath]                                                        $krb5_ccachedir                                = undef,
  Optional[String]                                                                      $krb5_ccname_template                          = undef,
  Optional[Integer[0]]                                                                  $krb5_auth_timeout                             = undef,
  Optional[Boolean]                                                                     $krb5_validate                                 = undef,
  Optional[Stdlib::Absolutepath]                                                        $krb5_keytab                                   = undef,
  Optional[Boolean]                                                                     $krb5_store_password_if_offline                = undef,
  Optional[Variant[Integer[0], Pattern[/(?x) ^ \d+ [smhd]? $/]]]                        $krb5_renewable_lifetime                       = undef,
  Optional[Variant[Integer[0], Pattern[/(?x) ^ \d+ [smhd]? $/]]]                        $krb5_lifetime                                 = undef,
  Optional[Variant[Integer[0], Pattern[/(?x) ^ \d+ [smhd]? $/]]]                        $krb5_renew_interval                           = undef,
  Optional[Enum['never', 'try', 'demand']]                                              $krb5_use_fast                                 = undef,
  Optional[String]                                                                      $krb5_fast_principal                           = undef,
  Optional[Boolean]                                                                     $krb5_canonicalize                             = undef,
  Optional[Boolean]                                                                     $krb5_use_kdcinfo                              = undef,
  Optional[Boolean]                                                                     $krb5_use_enterprise_principal                 = undef,
  Optional[Array[String, 1]]                                                            $krb5_map_user                                 = undef,
  Optional[Stdlib::Absolutepath]                                                        $krb5_confd_path                               = undef,
  # ad
  Optional[String]                                                                      $ad_domain                                     = undef,
  Optional[Array[Bodgitlib::Domain, 1]]                                                 $ad_enabled_domains                            = undef,
  Optional[Array[Variant[Bodgitlib::Host, Enum['_srv_']], 1]]                           $ad_server                                     = undef,
  Optional[Array[Bodgitlib::Host, 1]]                                                   $ad_backup_server                              = undef,
  Optional[Bodgitlib::Hostname]                                                         $ad_hostname                                   = undef,
  Optional[Boolean]                                                                     $ad_enable_dns_sites                           = undef,
  Optional[SSSD::AD::Access::Filter]                                                    $ad_access_filter                              = undef,
  Optional[String]                                                                      $ad_site                                       = undef,
  Optional[Boolean]                                                                     $ad_enable_gc                                  = undef,
  Optional[Enum['disabled', 'enforcing', 'permissive']]                                 $ad_gpo_access_control                         = undef,
  Optional[Integer[0]]                                                                  $ad_gpo_cache_timeout                          = undef,
  Optional[Array[String, 1]]                                                            $ad_gpo_map_interactive                        = undef,
  Optional[Array[String, 1]]                                                            $ad_gpo_map_remote_interactive                 = undef,
  Optional[Array[String, 1]]                                                            $ad_gpo_map_network                            = undef,
  Optional[Array[String, 1]]                                                            $ad_gpo_map_batch                              = undef,
  Optional[Array[String, 1]]                                                            $ad_gpo_map_service                            = undef,
  Optional[Array[String, 1]]                                                            $ad_gpo_map_permit                             = undef,
  Optional[Array[String, 1]]                                                            $ad_gpo_map_deny                               = undef,
  Optional[SSSD::AD::GPO::Default::Right]                                               $ad_gpo_default_right                          = undef,
  Optional[Integer[0]]                                                                  $ad_maximum_machine_account_password_age       = undef,
  Optional[Tuple[Integer[0], 2, 2]]                                                     $ad_machine_account_password_renewal_opts      = undef,
  # ipa
  Optional[String]                                                                      $ipa_domain                                    = undef,
  Optional[Array[Variant[Bodgitlib::Host, Enum['_srv_']], 1]]                           $ipa_server                                    = undef,
  Optional[Array[Bodgitlib::Host, 1]]                                                   $ipa_backup_server                             = undef,
  Optional[Bodgitlib::Hostname]                                                         $ipa_hostname                                  = undef,
  Optional[Boolean]                                                                     $ipa_enable_dns_sites                          = undef,
  Optional[Bodgitlib::LDAP::DN]                                                         $ipa_hbac_search_base                          = undef,
  Optional[Bodgitlib::LDAP::DN]                                                         $ipa_host_search_base                          = undef,
  Optional[Bodgitlib::LDAP::DN]                                                         $ipa_selinux_search_base                       = undef,
  Optional[Bodgitlib::LDAP::DN]                                                         $ipa_subdomains_search_base                    = undef,
  Optional[Bodgitlib::LDAP::DN]                                                         $ipa_master_domain_search_base                 = undef,
  Optional[Bodgitlib::LDAP::DN]                                                         $ipa_views_search_base                         = undef,
  Optional[Integer[0]]                                                                  $ipa_hbac_refresh                              = undef,
  Optional[Integer[0]]                                                                  $ipa_hbac_selinux                              = undef,
  Optional[Boolean]                                                                     $ipa_server_mode                               = undef,
  Optional[String]                                                                      $ipa_automount_location                        = undef,
  Optional[String]                                                                      $ipa_view_class                                = undef,
  Optional[String]                                                                      $ipa_view_name                                 = undef,
  Optional[String]                                                                      $ipa_override_object_class                     = undef,
  Optional[String]                                                                      $ipa_anchor_uuid                               = undef,
  Optional[String]                                                                      $ipa_user_override_object_class                = undef,
  Optional[String]                                                                      $ipa_group_override_object_class               = undef,
) {

  if ! defined(Class['::sssd']) {
    fail('You must include the sssd base class before using any sssd defined resources')
  }

  $config = {
    'id_provider'                                   => $id_provider,
    # options for any section
    'debug'                                         => $debug,
    'debug_level'                                   => $debug_level,
    'debug_timestamps'                              => $debug_timestamps,
    'debug_microseconds'                            => $debug_microseconds,
    'timeout'                                       => $timeout,
    # generic domain options
    'domain_type'                                   => $domain_type,
    'max_id'                                        => $max_id,
    'min_id'                                        => $min_id,
    'enumerate'                                     => $enumerate,
    'subdomain_enumerate'                           => $subdomain_enumerate ? {
      undef   => undef,
      default => join($subdomain_enumerate, ', '),
    },
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
    'subdomain_inherit'                             => $subdomain_inherit ? {
      undef   => undef,
      default => join($subdomain_inherit, ', '),
    },
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
    'dyndns_auth'                                   => $dyndns_auth,
    'dyndns_server'                                 => $dyndns_server,
    'override_homedir'                              => $override_homedir,
    'homedir_substring'                             => $homedir_substring,
    'wildcard_limit'                                => $wildcard_limit,
    # simple access provider
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
    # proxy
    'proxy_pam_target'                              => $proxy_pam_target,
    'proxy_lib_name'                                => $proxy_lib_name,
    'proxy_fast_alias'                              => $proxy_fast_alias,
    'proxy_max_children'                            => $proxy_max_children,
    # local
    'default_shell'                                 => $default_shell,
    'base_directory'                                => $base_directory,
    'create_homedir'                                => $create_homedir,
    'remove_homedir'                                => $remove_homedir,
    'homedir_umask'                                 => $homedir_umask,
    'skel_dir'                                      => $skel_dir,
    'mail_dir'                                      => $mail_dir,
    'userdel_cmd'                                   => $userdel_cmd,
    # ldap
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
    'ldap_auth_disable_tls_never_use_in_production' => $ldap_auth_disable_tls_never_use_in_production,
    'ldap_id_use_start_tls'                         => $ldap_id_use_start_tls,
    'ldap_id_mapping'                               => $ldap_id_mapping,
    'ldap_idmap_range_min'                          => $ldap_idmap_range_min,
    'ldap_idmap_range_max'                          => $ldap_idmap_range_max,
    'ldap_idmap_range_size'                         => $ldap_idmap_range_size,
    'ldap_idmap_default_domain_sid'                 => $ldap_idmap_default_domain_sid,
    'ldap_idmap_default_domain'                     => $ldap_idmap_default_domain,
    'ldap_idmap_autorid_compat'                     => $ldap_idmap_autorid_compat,
    'ldap_idmap_helper_table_size'                  => $ldap_idmap_helper_table_size,
    'ldap_max_id'                                   => $ldap_max_id,
    'ldap_min_id'                                   => $ldap_min_id,
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
    # krb5
    'krb5_server'                                   => $krb5_server ? {
      undef   => undef,
      default => join($krb5_server, ', '),
    },
    'krb5_backup_server'                            => $krb5_backup_server ? {
      undef   => undef,
      default => join($krb5_backup_server, ', '),
    },
    'krb5_realm'                                    => $krb5_realm,
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
    'krb5_canonicalize'                             => $krb5_canonicalize,
    'krb5_use_kdcinfo'                              => $krb5_use_kdcinfo,
    'krb5_use_enterprise_principal'                 => $krb5_use_enterprise_principal,
    'krb5_map_user'                                 => $krb5_map_user ? {
      undef   => undef,
      default => join($krb5_map_user, ', '),
    },
    'krb5_confd_path'                               => $krb5_confd_path,
    # ad
    'ad_domain'                                     => $ad_domain,
    'ad_enabled_domains'                            => $ad_enabled_domains ? {
      undef   => undef,
      default => join($ad_enabled_domains, ', '),
    },
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
    'ad_maximum_machine_account_password_age'       => $ad_maximum_machine_account_password_age,
    'ad_machine_account_password_renewal_opts'      => $ad_machine_account_password_renewal_opts ? {
      undef   => undef,
      default => join($ad_machine_account_password_renewal_opts, ':'),
    },
    # ipa
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
  }.filter |$x| { $x[1] =~ NotUndef }

  $config.each |String $setting, Any $value| {
    sssd_conf { "domain/${domain}/${setting}":
      target => $::sssd::conf_file,
      value  => $value,
      notify => Class['::sssd::daemon'],
    }
  }

  datacat_fragment { "${module_name} domain ${domain}":
    target => "${module_name} domains",
    data   => {
      'domain' => [$domain],
    },
  }
}
