# sssd

Tested with Travis CI

[![Build Status](https://travis-ci.org/bodgit/puppet-sssd.svg?branch=master)](https://travis-ci.org/bodgit/puppet-sssd)
[![Coverage Status](https://coveralls.io/repos/bodgit/puppet-sssd/badge.svg?branch=master&service=github)](https://coveralls.io/github/bodgit/puppet-sssd?branch=master)
[![Puppet Forge](http://img.shields.io/puppetforge/v/bodgit/sssd.svg)](https://forge.puppetlabs.com/bodgit/sssd)
[![Dependency Status](https://gemnasium.com/bodgit/puppet-sssd.svg)](https://gemnasium.com/bodgit/puppet-sssd)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with sssd](#setup)
    * [What sssd affects](#what-sssd-affects)
    * [Beginning with sssd](#beginning-with-sssd)
4. [Usage - Configuration options and additional functionality](#usage)
    * [Classes and Defined Types](#classes-and-defined-types)
        * [Class: sssd](#class-sssd)
        * [Class: sssd::dbus](#class-sssddbus)
        * [Defined Type: sssd::domain](#defined-type-sssddomain)
        * [Defined Type: sssd::service](#defined-type-sssdservice)
    * [Native Types](#native-types)
        * [Native Type: sssd_conf](#native-type-sssd_conf)
    * [Examples](#examples)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module manages SSSD.

## Module Description

This module can install the SSSD packages, configure any services and domains,
and optionally configure the D-Bus system service.

## Setup

### What sssd affects

* The package(s) providing the SSSD software.
* The `sssd.conf` configuration file containing any global, per-service and
  per-domain settings.
* The service controlling the `sssd` daemon.
* D-Bus system bus configuration to make SSSD data available over D-Bus.

### Beginning with sssd

```puppet
include ::sssd
::sssd::service { 'nss': }
::sssd::domain { 'example.com':
  id_provider => 'ldap',
  ...
}
```

## Usage

### Classes and Defined Types

#### Class: `sssd`

**Parameters within `sssd`:**

##### `conf_dir`

The base configuration directory, defaults to `/etc/sssd`.

##### `conf_file`

The configuration file, normally `${conf_dir}/sssd.conf`.

##### `package_name`

The name of the package to install that provides the SSSD software. Currently
it's assumed a single package or metapackage installs everything.

##### `service_name`

The name of the service managing `sssd`.

##### All other parameters

The following parameters map 1:1 to their equivalent in `sssd.conf(5)` for the
`[sssd]` section:

* `debug_level`
* `debug_timestamps`
* `debug_microseconds`
* `config_file_version`
* `reconnection_retries`
* `re_expression`
* `full_name_format`
* `try_inotify`
* `krb5_rcache_dir`
* `default_domain_suffix`
* `override_space`
* `user`

The `domains` and `services` parameters are managed automatically.

#### Class: `sssd::dbus`

**Parameters within `sssd::dbus`:**

##### `package_name`

The name of the package to install that provides the SSSD/D-Bus integration.

##### All other parameters

The following parameters map 1:1 to their equivalent in `sssd.conf(5)` for the
`[ifp]` section:

* `debug_level`
* `debug_timestamps`
* `debug_microseconds`
* `timeout`
* `reconnection_retries`
* `fd_limit`
* `client_idle_timeout`
* `force_timeout`
* `offline_timeout`
* `subdomain_inherit`
* `allowed_uids`
* `user_attributes`
* `wildcard_limit`

#### Defined Type: `sssd::domain`

**Parameters within `sssd::domain`:**

##### `name`

The label to associate with this domain.

##### All other parameters

The following parameters map 1:1 to their equivalent in `sssd.conf(5)` for the
`[domain/${name}]` section:

* `id_provider`
* `debug_level`
* `debug_timestamps`
* `debug_microseconds`
* `timeout`
* `max_id`
* `min_id`
* `enumerate`
* `subdomain_enumerate`
* `force_timeout`
* `entry_cache_timeout`
* `entry_cache_user_timeout`
* `entry_cache_group_timeout`
* `entry_cache_netgroup_timeout`
* `entry_cache_service_timeout`
* `entry_cache_sudo_timeout`
* `entry_cache_autofs_timeout`
* `entry_cache_ssh_host_timeout`
* `refresh_expired_interval`
* `cache_credentials`
* `cache_credentials_minimal_first_factor_length`
* `account_cache_expiration`
* `pwd_expiration_warning`
* `use_fully_qualified_names`
* `ignore_group_members`
* `auth_provider`
* `access_provider`
* `chpass_provider`
* `sudo_provider`
* `selinux_provider`
* `subdomains_provider`
* `autofs_provider`
* `hostid_provider`
* `re_expression`
* `full_name_format`
* `lookup_family_order`
* `dns_resolver_timeout`
* `dns_discovery_domain`
* `override_gid`
* `case_sensitive`
* `proxy_fast_alias`
* `subdomain_homedir`
* `realmd_tags`
* `cached_auth_timeout`
* `dyndns_update`
* `dyndns_ttl`
* `dyndns_iface`
* `dyndns_refresh_interval`
* `dyndns_update_ptr`
* `dyndns_force_tcp`
* `dyndns_server`
* `override_homedir`
* `homedir_substring`
* `wildcard_limit`
* `simple_allow_users`
* `simple_deny_users`
* `simple_allow_groups`
* `simple_deny_groups`
* `proxy_pam_target`
* `proxy_lib_name`
* `default_shell`
* `base_directory`
* `create_homedir`
* `remove_homedir`
* `homedir_umask`
* `skel_dir`
* `mail_dir`
* `userdel_cmd`
* `ldap_uri`
* `ldap_backup_uri`
* `ldap_chpass_uri`
* `ldap_chpass_backup_uri`
* `ldap_search_base`
* `ldap_schema`
* `ldap_default_bind_dn`
* `ldap_default_authtok_type`
* `ldap_default_authtok`
* `ldap_user_object_class`
* `ldap_user_name`
* `ldap_user_uid_number`
* `ldap_user_gid_number`
* `ldap_user_gecos`
* `ldap_user_home_directory`
* `ldap_user_shell`
* `ldap_user_uuid`
* `ldap_user_objectsid`
* `ldap_user_modify_timestamp`
* `ldap_user_shadow_last_change`
* `ldap_user_shadow_min`
* `ldap_user_shadow_max`
* `ldap_user_shadow_warning`
* `ldap_user_shadow_inactive`
* `ldap_user_shadow_expire`
* `ldap_user_krb_last_pwd_change`
* `ldap_user_krb_password_expiration`
* `ldap_user_ad_account_expires`
* `ldap_user_ad_user_account_control`
* `ldap_ns_account_lock`
* `ldap_user_nds_login_disabled`
* `ldap_user_nds_login_expiration_time`
* `ldap_user_nds_login_allowed_time_map`
* `ldap_user_principal`
* `ldap_user_extra_attrs`
* `ldap_user_ssh_public_key`
* `ldap_force_upper_case_realm`
* `ldap_enumeration_refresh_timeout`
* `ldap_purge_cache_timeout`
* `ldap_user_fullname`
* `ldap_user_member_of`
* `ldap_user_authorized_service`
* `ldap_user_authorized_host`
* `ldap_user_certificate`
* `ldap_group_object_class`
* `ldap_group_name`
* `ldap_group_gid_number`
* `ldap_group_member`
* `ldap_group_uuid`
* `ldap_group_objectsid`
* `ldap_group_modify_timestamp`
* `ldap_group_type`
* `ldap_group_external_member`
* `ldap_group_nesting_level`
* `ldap_groups_use_matching_rule_in_chain`
* `ldap_initgroups_use_matching_rule_in_chain`
* `ldap_use_tokengroups`
* `ldap_netgroup_object_class`
* `ldap_netgroup_name`
* `ldap_netgroup_member`
* `ldap_netgroup_triple`
* `ldap_netgroup_modify_timestamp`
* `ldap_service_object_class`
* `ldap_service_name`
* `ldap_service_port`
* `ldap_service_proto`
* `ldap_service_search_base`
* `ldap_search_timeout`
* `ldap_enumeration_search_timeout`
* `ldap_network_timeout`
* `ldap_opt_timeout`
* `ldap_connection_expire_timeout`
* `ldap_page_size`
* `ldap_disable_paging`
* `ldap_disable_range_retrieval`
* `ldap_sasl_minssf`
* `ldap_deref_threshold`
* `ldap_tls_reqcert`
* `ldap_tls_cacert`
* `ldap_tls_cacertdir`
* `ldap_tls_cert`
* `ldap_tls_key`
* `ldap_tls_cipher_suite`
* `ldap_id_use_start_tls`
* `ldap_id_mapping`
* `ldap_idmap_range_min`
* `ldap_idmap_range_max`
* `ldap_idmap_range_size`
* `ldap_idmap_default_domain_sid`
* `ldap_idmap_default_domain`
* `ldap_idmap_autorid_compat`
* `ldap_min_id`
* `ldap_max_id`
* `ldap_sasl_mech`
* `ldap_sasl_authid`
* `ldap_sasl_realm`
* `ldap_sasl_canonicalize`
* `ldap_krb5_keytab`
* `ldap_krb5_init_creds`
* `ldap_krb5_ticket_lifetime`
* `ldap_pwd_policy`
* `ldap_referrals`
* `ldap_dns_service_name`
* `ldap_chpass_dns_service_name`
* `ldap_chpass_update_last_change`
* `ldap_access_filter`
* `ldap_account_expire_policy`
* `ldap_access_order`
* `ldap_pwdlockout_dn`
* `ldap_deref`
* `ldap_rfc2307_fallback_to_local_users`
* `ldap_sudorule_object_class`
* `ldap_sudorule_name`
* `ldap_sudorule_command`
* `ldap_sudorule_host`
* `ldap_sudorule_user`
* `ldap_sudorule_option`
* `ldap_sudorule_runasuser`
* `ldap_sudorule_runasgroup`
* `ldap_sudorule_notbefore`
* `ldap_sudorule_notafter`
* `ldap_sudorule_order`
* `ldap_sudo_full_refresh_interval`
* `ldap_sudo_smart_refresh_interval`
* `ldap_sudo_use_host_filter`
* `ldap_sudo_hostnames`
* `ldap_sudo_ip`
* `ldap_sudo_include_netgroups`
* `ldap_sudo_include_regexp`
* `ldap_autofs_map_master_name`
* `ldap_autofs_map_object_class`
* `ldap_autofs_map_name`
* `ldap_autofs_entry_object_class`
* `ldap_autofs_entry_key`
* `ldap_autofs_entry_value`
* `ldap_netgroup_search_base`
* `ldap_user_search_base`
* `ldap_group_search_base`
* `ldap_sudo_search_base`
* `ldap_autofs_search_base`
* `krb5_server`
* `krb5_backup_server`
* `krb5_realm`
* `krb5_canonicalize`
* `krb5_use_kdcinfo`
* `krb5_kpasswd`
* `krb5_backup_kpasswd`
* `krb5_ccachedir`
* `krb5_ccname_template`
* `krb5_auth_timeout`
* `krb5_validate`
* `krb5_keytab`
* `krb5_store_password_if_offline`
* `krb5_renewable_lifetime`
* `krb5_lifetime`
* `krb5_renew_interval`
* `krb5_use_fast`
* `krb5_fast_principal`
* `krb5_use_enterprise_principal`
* `krb5_map_user`
* `krb5_confd_path`
* `ad_domain`
* `ad_server`
* `ad_backup_server`
* `ad_hostname`
* `ad_enable_dns_sites`
* `ad_access_filter`
* `ad_site`
* `ad_enable_gc`
* `ad_gpo_access_control`
* `ad_gpo_cache_timeout`
* `ad_gpo_map_interactive`
* `ad_gpo_map_remote_interactive`
* `ad_gpo_map_network`
* `ad_gpo_map_batch`
* `ad_gpo_map_service`
* `ad_gpo_map_permit`
* `ad_gpo_map_deny`
* `ad_gpo_default_right`
* `ipa_domain`
* `ipa_server`
* `ipa_backup_server`
* `ipa_hostname`
* `ipa_enable_dns_sites`
* `ipa_hbac_search_base`
* `ipa_host_search_base`
* `ipa_selinux_search_base`
* `ipa_subdomains_search_base`
* `ipa_master_domain_search_base`
* `ipa_views_search_base`
* `ipa_hbac_refresh`
* `ipa_hbac_selinux`
* `ipa_server_mode`
* `ipa_automount_location`
* `ipa_view_class`
* `ipa_view_name`
* `ipa_override_object_class`
* `ipa_anchor_uuid`
* `ipa_user_override_object_class`
* `ipa_group_override_object_class`

#### Defined Type: `sssd::service`

**Parameters within `sssd::service`:**

##### `name`

The name of the service. Valid services are `nss`, `pam`, `sudo`, `autofs`,
`ssh`, `pac` or `ifp`. Note that the `ifp` service is managed by the
[`sssd::dbus`](#class-sssddbus) class.

##### All other parameters

The following parameters map 1:1 to their equivalent in `sssd.conf(5)` for the
`[${name}]` section:

* `debug_level`
* `debug_timestamps`
* `debug_microseconds`
* `timeout`
* `reconnection_retries`
* `fd_limit`
* `client_idle_timeout`
* `force_timeout`
* `offline_timeout`
* `subdomain_inherit`
* `enum_cache_timeout`
* `entry_cache_nowait_percentage`
* `entry_negative_timeout`
* `filter_groups`
* `filter_users`
* `filter_users_in_groups`
* `override_homedir`
* `homedir_substring`
* `fallback_homedir`
* `override_shell`
* `allowed_shells`
* `vetoed_shells`
* `shell_fallback`
* `default_shell`
* `get_domains_timeout`
* `memcache_timeout`
* `user_attributes`
* `offline_credentials_expiration`
* `offline_failed_login_attempts`
* `offline_failed_login_delay`
* `pam_verbosity`
* `pam_id_timeout`
* `pam_pwd_expiration_warning`
* `pam_trusted_users`
* `pam_public_domains`
* `pam_account_expired_message`
* `sudo_timed`
* `autofs_negative_timeout`
* `ssh_hash_known_hosts`
* `ssh_known_hosts_timeout`
* `ca_db`
* `allowed_uids`
* `wildcard_limit`

### Functions

#### Function: `validate_sssd_search_base`

Validate a string or array of strings are valid SSSD search bases.

~~~
validate_sssd_search_base('dc=example,dc=com')
validate_sssd_search_base('dc=example,dc=com?subtree?')
validate_sssd_search_base('cn=host_specific,dc=example,dc=com?subtree?(host=thishost)?dc=example.com?subtree?')
validate_sssd_search_base(['dc=example,dc=com'])
~~~

### Native Types

#### Native Type: `sssd_conf`

```puppet
Sssd_conf {
  target => '/etc/sssd/sssd.conf',
}

sssd_conf { 'Configuration file version':
  ensure  => present,
  section => 'sssd',
  setting => 'config_file_version',
  value   => '2',
}

sssd_conf { 'sssd/debug_level':
  ensure => absent,
}
```

**Parameters within `sssd_conf`:**

##### `name`

The name of the section and setting separated by `/`, or a unique string.

##### `ensure`

Standard ensurable parameter.

##### `section`

The section in the `sssd.conf` file where the setting resides. Defaults to the
global `[sssd]` section.

##### `setting`

The name of the setting to manage.

##### `value`

The value of the setting.

##### `target`

The file in which to manage the setting. Defaults to `/etc/sssd/sssd.conf`. 

If a file resource exists in the catalogue for this value it will be
autorequired.

### Examples

Configure SSSD to use LDAP for NSS:

```puppet
include ::sssd
::sssd::service { 'nss': }
::sssd::domain { 'example.com':
  id_provider           => 'ldap',
  ldap_schema           => 'rfc2307',
  ldap_uri              => ['ldap://192.0.2.1'],
  ldap_search_base      => 'dc=example,dc=com',
  ldap_tls_reqcert      => 'never',
  ldap_id_use_start_tls => false,
  ldap_default_bind_dn  => 'cn=Manager,dc=example,dc=com',
  ldap_default_authtok  => 'secret',
}

class { '::nsswitch':
  passwd => ['files', 'sss'],
  shadow => ['files', 'sss'],
  group  => ['files', 'sss'],
}

Class['::sssd'] -> Class['::nsswitch']
```

Extend the above example to also make the SSSD data available over D-Bus:

```puppet
include ::dbus
include ::sssd
::sssd::service { 'nss': }
::sssd::domain { 'example.com':
  id_provider           => 'ldap',
  ldap_schema           => 'rfc2307',
  ldap_uri              => ['ldap://192.0.2.1'],
  ldap_search_base      => 'dc=example,dc=com',
  ldap_tls_reqcert      => 'never',
  ldap_id_use_start_tls => false,
  ldap_default_bind_dn  => 'cn=Manager,dc=example,dc=com',
  ldap_default_authtok  => 'secret',
}
include ::sssd::dbus

class { '::nsswitch':
  passwd => ['files', 'sss'],
  shadow => ['files', 'sss'],
  group  => ['files', 'sss'],
}

Class['::sssd'] -> Class['::nsswitch']
```

## Reference

### Classes

#### Public Classes

* [`sssd`](#class-sssd): Main class for managing SSSD.
* [`sssd::dbus`](#class-sssddbus): Main class for managing SSSD/D-Bus
  integration.

#### Private Classes

* `sssd::install`: Handles SSSD installation.
* `sssd::config`: Handles global SSSD configuration.
* `sssd::params`: Different configuration data for different systems.
* `sssd::daemon`: Manages the `sssd` service.
* `sssd::dbus::install`: Handles SSSD/D-Bus installation.
* `sssd::dbus::config`: Handles configuring the SSSD/D-Bus integration.

### Defined Types

#### Public Defined Types

* [`sssd::domain`](#defined-type-sssddomain): Handles per-domain configuration.
* [`sssd::service`](#defined-type-sssdservice): Handles per-service
  configuration.

### Functions

* [`validate_sssd_search_base`](#function-validatesssdsearchbase): Parameter
  validation.

### Native Types

* [`sssd_conf`](#native-type-sssd_conf): Manages a setting in the SSSD
  configuration file.

## Limitations

This module takes the (somewhat laborious) approach of creating parameters for
each `sssd.conf` setting rather than just pass in a large hash of settings
which should result in more control.

Any setting that accepts the boolean `TRUE`/`FALSE` values is mapped to a
native Puppet boolean type. Any multi-valued setting accepts an array of
values.

Currently almost all parameters are optional, the only mandatory parameter is
that of the identity provider (`id_provider`) for the
[`sssd::domain`](#defined-type-sssddomain) defined type. This may change in
the future if the logic becomes more obvious.

This module has been built on and tested against Puppet 3.0 and higher.

The module has been tested on:

* RedHat/CentOS Enterprise Linux 6/7

Testing on other platforms has been light and cannot be guaranteed.

## Development

Please log issues or pull requests at
[github](https://github.com/bodgit/puppet-sssd).
