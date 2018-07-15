# @!visibility private
class sssd::config {

  $user = $::sssd::user

  $owner = $user ? {
    undef   => 0,
    default => $user,
  }

  file { $::sssd::conf_dir:
    ensure => directory,
    owner  => $owner,
    group  => 0,
    mode   => '0611',
  }

  file { $::sssd::conf_file:
    ensure => file,
    owner  => $owner,
    group  => 0,
    mode   => '0600',
  }

  Sssd_conf {
    target => $::sssd::conf_file,
  }

  resources { 'sssd_conf':
    purge => true,
  }

  $config = delete_undef_values({
    'debug'                    => $::sssd::debug,
    'debug_level'              => $::sssd::debug_level,
    'debug_timestamps'         => $::sssd::debug_timestamps,
    'debug_microseconds'       => $::sssd::debug_microseconds,
    'config_file_version'      => $::sssd::config_file_version,
    'reconnection_retries'     => $::sssd::reconnection_retries,
    're_expression'            => $::sssd::re_expression,
    'full_name_format'         => $::sssd::full_name_format,
    'try_inotify'              => $::sssd::try_inotify,
    'krb5_rcache_dir'          => $::sssd::krb5_rcache_dir,
    'user'                     => $user,
    'default_domain_suffix'    => $::sssd::default_domain_suffix,
    'override_space'           => $::sssd::override_space,
    'certificate_verification' => $::sssd::certificate_verification ? {
      undef   => undef,
      default => join($::sssd::certificate_verification.map |SSSD::Certificate::Verification $x| {
        type($x) ? {
          Type[String] => $x,
          default      => join($x, '='),
        }
      }, ', '),
    },
    'disable_netlink'          => $::sssd::disable_netlink,
    'enable_files_domain'      => $::sssd::enable_files_domain,
    'domain_resolution_order'  => $::sssd::domain_resolution_order ? {
      undef   => undef,
      default => join($::sssd::domain_resolution_order, ', '),
    },
    'services'                 => '',
    'domains'                  => '',
  })

  $config.each |$setting, $value| {
    sssd_conf { "sssd/${setting}":
      value => $value,
    }
  }

  datacat_collector { "${module_name} services":
    template_body   => '<%= @data["service"] and @data["service"].sort.join(", ") %>',
    target_resource => Sssd_conf['sssd/services'],
    target_field    => 'value',
    before          => Sssd_conf['sssd/services'],
  }

  datacat_collector { "${module_name} domains":
    template_body   => '<%= @data["domain"] and @data["domain"].sort.join(", ") %>',
    target_resource => Sssd_conf['sssd/domains'],
    target_field    => 'value',
    before          => Sssd_conf['sssd/domains'],
  }
}
