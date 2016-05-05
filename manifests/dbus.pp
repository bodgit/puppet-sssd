#
class sssd::dbus (
  $package_name         = $::sssd::params::dbus_package_name,
  # options for any section
  $debug_level          = undef,
  $debug_timestamps     = undef,
  $debug_microseconds   = undef,
  # generic service options
  $timeout              = undef,
  $reconnection_retries = undef,
  $fd_limit             = undef,
  $client_idle_timeout  = undef,
  $force_timeout        = undef,
  $offline_timeout      = undef,
  $subdomain_inherit    = undef,
  # options for [ifp] section
  $allowed_uids         = undef,
  $user_attributes      = undef,
  $wildcard_limit       = undef,
) inherits ::sssd::params {

  if ! defined(Class['::sssd']) {
    fail('You must include the sssd base class before using the sssd::dbus class') # lint:ignore:80chars
  }

  validate_string($package_name)

  include ::sssd::dbus::install
  include ::sssd::dbus::config

  anchor { 'sssd::dbus::begin': }
  anchor { 'sssd::dbus::end': }

  Anchor['sssd::dbus::begin'] -> Class['::sssd::dbus::install']
    ~> Class['::sssd::dbus::config'] -> Anchor['sssd::dbus::end']

  Class['::dbus'] -> Class['::sssd']
}
