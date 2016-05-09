#
define sssd::service (
  # options for any section
  $debug_level                    = undef,
  $debug_timestamps               = undef,
  $debug_microseconds             = undef,
  # generic service options
  $timeout                        = undef,
  $reconnection_retries           = undef,
  $fd_limit                       = undef,
  $client_idle_timeout            = undef,
  $force_timeout                  = undef,
  $offline_timeout                = undef,
  $subdomain_inherit              = undef,
  # options for [nss] section
  $enum_cache_timeout             = undef,
  $entry_cache_nowait_percentage  = undef,
  $entry_negative_timeout         = undef,
  $filter_groups                  = undef,
  $filter_users                   = undef,
  $filter_users_in_groups         = undef,
  $override_homedir               = undef,
  $homedir_substring              = undef,
  $fallback_homedir               = undef,
  $override_shell                 = undef,
  $allowed_shells                 = undef,
  $vetoed_shells                  = undef,
  $shell_fallback                 = undef,
  $default_shell                  = undef,
  $get_domains_timeout            = undef,
  $memcache_timeout               = undef,
  $user_attributes                = undef,
  # options for [pam] section
  $offline_credentials_expiration = undef,
  $offline_failed_login_attempts  = undef,
  $offline_failed_login_delay     = undef,
  $pam_verbosity                  = undef,
  $pam_id_timeout                 = undef,
  $pam_pwd_expiration_warning     = undef,
  # $get_domains_timeout (already defined for nss)
  $pam_trusted_users              = undef,
  $pam_public_domains             = undef,
  $pam_account_expired_message    = undef,
  # options for [sudo] section
  $sudo_timed                     = undef,
  # options for [autofs] section
  $autofs_negative_timeout        = undef,
  # options for [ssh] section
  $ssh_hash_known_hosts           = undef,
  $ssh_known_hosts_timeout        = undef,
  $ca_db                          = undef,
  # options for [pac] section
  $allowed_uids                   = undef,
  # options for [ifp] section
  # $allowed_uids (already defined for pac)
  # $user_attributes (already defined for nss)
  $wildcard_limit                 = undef,
) {

  if ! defined(Class['::sssd']) {
    fail('You must include the sssd base class before using any sssd defined resources') # lint:ignore:80chars
  }

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
  if $reconnection_retries {
    validate_integer($reconnection_retries, '', 0)
  }
  if $fd_limit {
    validate_integer($fd_limit, '', 0)
  }
  if $client_idle_timeout {
    validate_integer($client_idle_timeout, '', 0)
  }
  if $force_timeout {
    validate_integer($force_timeout, '', 0)
  }
  if $offline_timeout {
    validate_integer($offline_timeout, '', 0)
  }
  if $subdomain_inherit {
    validate_array($subdomain_inherit)
  }

  $global_config = delete_undef_values({
    'debug_level'          => $debug_level,
    'debug_timestamps'     => $debug_timestamps,
    'debug_microseconds'   => $debug_microseconds,
    'timeout'              => $timeout,
    'reconnection_retries' => $reconnection_retries,
    'fd_limit'             => $fd_limit,
    'client_idle_timeout'  => $client_idle_timeout,
    'force_timeout'        => $force_timeout,
    'offline_timeout'      => $offline_timeout,
    'subdomain_inherit'    => $subdomain_inherit ? {
      undef   => undef,
      default => join($subdomain_inherit, ', '),
    },
  })

  case $name {
    'nss': {
      if $enum_cache_timeout {
        validate_integer($enum_cache_timeout, '', 0)
      }
      if $entry_cache_nowait_percentage {
        validate_integer($entry_cache_nowait_percentage, '', 0)
      }
      if $entry_negative_timeout {
        validate_integer($entry_negative_timeout, '', 0)
      }
      if $filter_users {
        validate_array($filter_users)
      }
      if $filter_groups {
        validate_array($filter_groups)
      }
      if $filter_users_in_groups {
        validate_bool($filter_users_in_groups)
      }
      if $override_homedir {
        validate_absolute_path($override_homedir)
      }
      if $homedir_substring {
        validate_absolute_path($homedir_substring)
      }
      if $fallback_homedir {
        validate_absolute_path($fallback_homedir)
      }
      if $override_shell {
        validate_absolute_path($override_shell)
      }
      if $allowed_shells {
        validate_array($allowed_shells)
      }
      if $vetoed_shells {
        validate_array($vetoed_shells)
      }
      if $shell_fallback {
        validate_absolute_path($shell_fallback)
      }
      if $default_shell {
        validate_absolute_path($default_shell)
      }
      if $get_domains_timeout {
        validate_integer($get_domains_timeout, '', 0)
      }
      if $memcache_timeout {
        validate_integer($memcache_timeout, '', 0)
      }
      if $user_attributes {
        validate_array($user_attributes)
      }

      $service_config = delete_undef_values({
        'enum_cache_timeout'            => $enum_cache_timeout,
        'entry_cache_nowait_percentage' => $entry_cache_nowait_percentage,
        'entry_negative_timeout'        => $entry_negative_timeout,
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
      })
    }
    'pam': {
      if $offline_credentials_expiration {
        validate_integer($offline_credentials_expiration, '', 0)
      }
      if $offline_failed_login_attempts {
        validate_integer($offline_failed_login_attempts, '', 0)
      }
      if $offline_failed_login_delay {
        validate_integer($offline_failed_login_delay, '', 0)
      }
      if $pam_verbosity {
        validate_integer($pam_verbosity, 3, 0)
      }
      if $pam_id_timeout {
        validate_integer($pam_id_timeout, '', 0)
      }
      if $pam_pwd_expiration_warning {
        validate_integer($pam_pwd_expiration_warning, '', 0)
      }
      if $get_domains_timeout {
        validate_integer($get_domains_timeout, '', 0)
      }
      if $pam_trusted_users {
        validate_array($pam_trusted_users)
      }
      if $pam_public_domains {
        validate_array($pam_public_domains)
      }
      if $pam_account_expired_message {
        validate_string($pam_account_expired_message)
      }

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
      })
    }
    'sudo': {
      if $sudo_timed {
        validate_bool($sudo_timed)
      }

      $service_config = delete_undef_values({
        'sudo_timed' => $sudo_timed,
      })
    }
    'autofs': {
      if $autofs_negative_timeout {
        validate_integer($autofs_negative_timeout, '', 0)
      }

      $service_config = delete_undef_values({
        'autofs_negative_timeout' => $autofs_negative_timeout,
      })
    }
    'ssh': {
      if $ssh_hash_known_hosts {
        validate_bool($ssh_hash_known_hosts)
      }
      if $ssh_known_hosts_timeout {
        validate_integer($ssh_known_hosts_timeout, '', 0)
      }
      if $ca_db {
        validate_absolute_path($ca_db)
      }

      $service_config = delete_undef_values({
        'ssh_hash_known_hosts'    => $ssh_hash_known_hosts,
        'ssh_known_hosts_timeout' => $ssh_known_hosts_timeout,
        'ca_db'                   => $ca_db,
      })
    }
    'pac': {
      if $allowed_uids {
        validate_array($allowed_uids)
      }

      $service_config = delete_undef_values({
        'allowed_uids' => $allowed_uids ? {
          undef   => undef,
          default => join($allowed_uids, ', '),
        },
      })
    }
    'ifp': {
      if $allowed_uids {
        validate_array($allowed_uids)
      }
      if $user_attributes {
        validate_array($user_attributes)
      }
      if $wildcard_limit {
        validate_integer($wildcard_limit, '', 0)
      }

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
      fail("The ${name} sssd service is not supported.")
    }
  }

  $config = merge($global_config, $service_config)

  $titles = prefix(keys($config), "${name}/")
  $values = parsejson(inline_template('<%= @config.values.map { |x| { "value" => x } }.to_json %>'))

  Sssd_conf {
    target => $::sssd::conf_file,
    notify => Class['::sssd::daemon'],
  }

  create_resources(sssd_conf, hash(zip($titles, $values)), {'ensure' => 'present'})

  datacat_fragment { "sssd service ${name}":
    target => 'sssd services',
    data   => {
      'service' => [$name],
    },
  }
}
