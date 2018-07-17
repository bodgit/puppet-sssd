# Define an SSSD service.
#
# @example Enable NSS service
#   include ::sssd
#   ::sssd::service { 'nss': }
#
# @param service
# @param use_socket_activation
# @param debug
# @param debug_level
# @param debug_timestamps
# @param debug_microseconds
# @param timeout
# @param reconnection_retries
# @param fd_limit
# @param client_idle_timeout
# @param offline_timeout
# @param responder_idle_timeout
# @param cache_first
# @param enum_cache_timeout
# @param entry_cache_nowait_percentage
# @param entry_negative_timeout
# @param local_negative_timeout
# @param filter_groups
# @param filter_users
# @param filter_users_in_groups
# @param override_homedir
# @param homedir_substring
# @param fallback_homedir
# @param override_shell
# @param allowed_shells
# @param vetoed_shells
# @param shell_fallback
# @param default_shell
# @param get_domains_timeout
# @param memcache_timeout
# @param user_attributes
# @param pwfield
# @param offline_credentials_expiration
# @param offline_failed_login_attempts
# @param offline_failed_login_delay
# @param pam_verbosity
# @param pam_response_filter
# @param pam_id_timeout
# @param pam_pwd_expiration_warning
# @param pam_trusted_users
# @param pam_public_domains
# @param pam_account_expired_message
# @param pam_account_locked_message
# @param pam_cert_auth
# @param pam_cert_db_path
# @param p11_child_timeout
# @param pam_app_services
# @param sudo_timed
# @param autofs_negative_timeout
# @param ssh_hash_known_hosts
# @param ssh_known_hosts_timeout
# @param ca_db
# @param allowed_uids
# @param pac_lifetime
# @param wildcard_limit
#
# @see puppet_classes::sssd ::sssd
# @see puppet_classes::sssd::dbus ::sssd::dbus
#
# @since 1.0.0
define sssd::service (
  SSSD::Type                                                   $service                        = $title,
  Boolean                                                      $use_socket_activation          = $::sssd::use_socket_activation,
  # options for any section
  Optional[Integer[0]]                                         $debug                          = undef,
  Optional[Integer[0]]                                         $debug_level                    = undef,
  Optional[Boolean]                                            $debug_timestamps               = undef,
  Optional[Boolean]                                            $debug_microseconds             = undef,
  # generic service options
  Optional[Integer[0]]                                         $timeout                        = undef,
  Optional[Integer[0]]                                         $reconnection_retries           = undef,
  Optional[Integer[0]]                                         $fd_limit                       = undef,
  Optional[Integer[0]]                                         $client_idle_timeout            = undef,
  Optional[Integer[0]]                                         $offline_timeout                = undef,
  Optional[Integer[0]]                                         $responder_idle_timeout         = undef,
  Optional[Boolean]                                            $cache_first                    = undef,
  # options for [nss] section
  Optional[Integer[0]]                                         $enum_cache_timeout             = undef,
  Optional[Integer[0]]                                         $entry_cache_nowait_percentage  = undef,
  Optional[Integer[0]]                                         $entry_negative_timeout         = undef,
  Optional[Integer[0]]                                         $local_negative_timeout         = undef,
  Optional[Array[String, 1]]                                   $filter_groups                  = undef,
  Optional[Array[String, 1]]                                   $filter_users                   = undef,
  Optional[Boolean]                                            $filter_users_in_groups         = undef,
  Optional[Stdlib::Absolutepath]                               $override_homedir               = undef,
  Optional[Stdlib::Absolutepath]                               $homedir_substring              = undef,
  Optional[Stdlib::Absolutepath]                               $fallback_homedir               = undef,
  Optional[Stdlib::Absolutepath]                               $override_shell                 = undef,
  Optional[Array[Variant[Stdlib::Absolutepath, Enum['*']], 1]] $allowed_shells                 = undef,
  Optional[Array[Stdlib::Absolutepath, 1]]                     $vetoed_shells                  = undef,
  Optional[Stdlib::Absolutepath]                               $shell_fallback                 = undef,
  Optional[Stdlib::Absolutepath]                               $default_shell                  = undef,
  Optional[Integer[0]]                                         $get_domains_timeout            = undef,
  Optional[Integer[0]]                                         $memcache_timeout               = undef,
  Optional[Array[String, 1]]                                   $user_attributes                = undef,
  Optional[String]                                             $pwfield                        = undef,
  # options for [pam] section
  Optional[Integer[0]]                                         $offline_credentials_expiration = undef,
  Optional[Integer[0]]                                         $offline_failed_login_attempts  = undef,
  Optional[Integer[0]]                                         $offline_failed_login_delay     = undef,
  Optional[Integer[0, 3]]                                      $pam_verbosity                  = undef,
  Optional[Array[String, 1]]                                   $pam_response_filter            = undef,
  Optional[Integer[0]]                                         $pam_id_timeout                 = undef,
  Optional[Integer[0]]                                         $pam_pwd_expiration_warning     = undef,
  # $get_domains_timeout (already defined for nss)
  Optional[Array[Variant[Integer[0], String], 1]]              $pam_trusted_users              = undef,
  Optional[Array[String, 1]]                                   $pam_public_domains             = undef,
  Optional[String]                                             $pam_account_expired_message    = undef,
  Optional[String]                                             $pam_account_locked_message     = undef,
  Optional[Boolean]                                            $pam_cert_auth                  = undef,
  Optional[Stdlib::Absolutepath]                               $pam_cert_db_path               = undef,
  Optional[Integer[0]]                                         $p11_child_timeout              = undef,
  Optional[Array[String, 1]]                                   $pam_app_services               = undef,
  # options for [sudo] section
  Optional[Boolean]                                            $sudo_timed                     = undef,
  # options for [autofs] section
  Optional[Integer[0]]                                         $autofs_negative_timeout        = undef,
  # options for [ssh] section
  Optional[Boolean]                                            $ssh_hash_known_hosts           = undef,
  Optional[Integer[0]]                                         $ssh_known_hosts_timeout        = undef,
  Optional[Stdlib::Absolutepath]                               $ca_db                          = undef,
  # options for [pac] section
  Optional[Array[Variant[Integer[0], String], 1]]              $allowed_uids                   = undef,
  Optional[Integer[0]]                                         $pac_lifetime                   = undef,
  # options for [ifp] section
  # $allowed_uids (already defined for pac)
  # $user_attributes (already defined for nss)
  Optional[Integer[0]]                                         $wildcard_limit                 = undef,
) {

  if ! defined(Class['::sssd']) {
    fail('You must include the sssd base class before using any sssd defined resources')
  }

  if $use_socket_activation and $::service_provider != 'systemd' {
    fail('Systemd is required for socket-activated services')
  }

  $global_config = delete_undef_values({
    'debug'                  => $debug,
    'debug_level'            => $debug_level,
    'debug_timestamps'       => $debug_timestamps,
    'debug_microseconds'     => $debug_microseconds,
    'timeout'                => $timeout,
    'reconnection_retries'   => $reconnection_retries,
    'fd_limit'               => $fd_limit,
    'client_idle_timeout'    => $client_idle_timeout,
    'offline_timeout'        => $offline_timeout,
    'responder_idle_timeout' => $responder_idle_timeout,
    'cache_first'            => $cache_first,
  })

  case $service {
    'nss': {
      $service_config = delete_undef_values({
        'enum_cache_timeout'            => $enum_cache_timeout,
        'entry_cache_nowait_percentage' => $entry_cache_nowait_percentage,
        'entry_negative_timeout'        => $entry_negative_timeout,
        'local_negative_timeout'        => $local_negative_timeout,
        'filter_groups'                 => $filter_groups ? {
          undef   => undef,
          default => join($filter_groups, ', '),
        },
        'filter_users'                  => $filter_users ? {
          undef   => undef,
          default => join($filter_users, ', '),
        },
        'filter_users_in_groups'        => $filter_users_in_groups,
        'override_homedir'              => $override_homedir,
        'homedir_substring'             => $homedir_substring,
        'fallback_homedir'              => $fallback_homedir,
        'override_shell'                => $override_shell,
        'allowed_shells'                => $allowed_shells ? {
          undef   => undef,
          default => join($allowed_shells, ', '),
        },
        'vetoed_shells'                 => $vetoed_shells ? {
          undef   => undef,
          default => join($vetoed_shells, ', '),
        },
        'shell_fallback'                => $shell_fallback,
        'default_shell'                 => $default_shell,
        'get_domains_timeout'           => $get_domains_timeout,
        'memcache_timeout'              => $memcache_timeout,
        'user_attributes'               => $user_attributes ? {
          undef   => undef,
          default => join($user_attributes, ', '),
        },
        'pwfield'                       => $pwfield,
      })
    }
    'pam': {
      $service_config = delete_undef_values({
        'offline_credentials_expiration' => $offline_credentials_expiration,
        'offline_failed_login_attempts'  => $offline_failed_login_attempts,
        'offline_failed_login_delay'     => $offline_failed_login_delay,
        'pam_verbosity'                  => $pam_verbosity,
        'pam_id_timeout'                 => $pam_id_timeout,
        'pam_pwd_expiration_warning'     => $pam_pwd_expiration_warning,
        'get_domains_timeout'            => $get_domains_timeout,
        'pam_trusted_users'              => $pam_trusted_users ? {
          undef   => undef,
          default => join($pam_trusted_users, ', '),
        },
        'pam_public_domains'             => $pam_public_domains ? {
          undef   => undef,
          default => join($pam_public_domains, ', '),
        },
        'pam_account_expired_message'    => $pam_account_expired_message,
        'pam_account_locked_message'     => $pam_account_locked_message,
        'pam_cert_auth'                  => $pam_cert_auth,
        'pam_cert_db_path'               => $pam_cert_db_path,
        'p11_child_timeout'              => $p11_child_timeout,
        'pam_app_services'               => $pam_app_services ? {
          undef   => undef,
          default => join($pam_app_services, ', '),
        },
      })
    }
    'sudo': {
      $service_config = delete_undef_values({
        'sudo_timed' => $sudo_timed,
      })
    }
    'autofs': {
      $service_config = delete_undef_values({
        'autofs_negative_timeout' => $autofs_negative_timeout,
      })
    }
    'ssh': {
      $service_config = delete_undef_values({
        'ssh_hash_known_hosts'    => $ssh_hash_known_hosts,
        'ssh_known_hosts_timeout' => $ssh_known_hosts_timeout,
        'ca_db'                   => $ca_db,
      })
    }
    'pac': {
      $service_config = delete_undef_values({
        'allowed_uids' => $allowed_uids ? {
          undef   => undef,
          default => join($allowed_uids, ', '),
        },
        'pac_lifetime' => $pac_lifetime,
      })
    }
    'ifp': {
      $service_config = delete_undef_values({
        'allowed_uids'    => $allowed_uids ? {
          undef   => undef,
          default => join($allowed_uids, ', '),
        },
        'user_attributes' => $user_attributes ? {
          undef   => undef,
          default => join($user_attributes, ', '),
        },
        'wildcard_limit'  => $wildcard_limit,
      })
    }
    default: {
      fail("The ${service} sssd service is not supported.")
    }
  }

  $config = merge($global_config, $service_config)

  $config.each |String $setting, Any $value| {
    sssd_conf { "${service}/${setting}":
      target => $::sssd::conf_file,
      value  => $value,
      notify => Class['::sssd::daemon'],
    }
  }

  if $use_socket_activation {

    if has_key($::sssd::socket_services, $service) {
      Array($::sssd::socket_services[$service], true).each |String $x| {
        service { $x:
          enable => true,
        }
      }
    }
  } else {

    if $::service_provider == 'systemd' {

      if has_key($::sssd::socket_services, $service) {
        Array($::sssd::socket_services[$service], true).each |String $x| {
          service { $x:
            ensure => stopped,
            enable => false,
          }
        }
      }
    }

    datacat_fragment { "${module_name} service ${service}":
      target => "${module_name} services",
      data   => {
        'service' => [$service],
      },
    }
  }
}
