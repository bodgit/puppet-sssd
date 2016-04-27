#
class sssd (
  $conf_dir              = $::sssd::params::conf_dir,
  $conf_file             = $::sssd::params::conf_file,
  $package_name          = $::sssd::params::package_name,
  $service_name          = $::sssd::params::service_name,
  # options for any section
  $debug_level           = undef,
  $debug_timestamps      = undef,
  $debug_microseconds    = undef,
  # options for [sssd] section
  $config_file_version   = 2,
  $reconnection_retries  = undef,
  $re_expression         = undef,
  $full_name_format      = undef,
  $try_inotify           = undef,
  $krb5_rcache_dir       = undef,
  $default_domain_suffix = undef,
  $override_space        = undef,
  $user                  = undef,
) inherits ::sssd::params {

  validate_absolute_path($conf_dir)
  validate_absolute_path($conf_file)
  validate_string($package_name)
  validate_string($service_name)

  if $debug_level {
    validate_re($debug_level, ['^\d+$', '^0x[\da-fA-F]+$'])
  }
  if $debug_timestamps {
    validate_bool($debug_timestamps)
  }
  if $debug_microseconds {
    validate_bool($debug_microseconds)
  }

  validate_integer($config_file_version, '', 2)
  if $reconnection_retries {
    validate_integer($reconnection_retries, '', 0)
  }
  validate_string($re_expression)
  validate_string($full_name_format)
  if $try_inotify {
    validate_bool($try_inotify)
  }
  if $krb5_rcache_dir {
    validate_absolute_path($krb5_rcache_dir)
  }
  validate_string($default_domain_suffix)
  validate_string($override_space)
  validate_string($user)

  include ::sssd::install
  include ::sssd::config
  include ::sssd::daemon

  anchor { 'sssd::begin': }
  anchor { 'sssd::end': }

  Anchor['sssd::begin'] -> Class['::sssd::install'] ~> Class['::sssd::config']
    ~> Class['::sssd::daemon'] -> Anchor['sssd::end']
}
