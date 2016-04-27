#
class sssd::dbus::install {

  package { 'sssd-dbus':
    ensure => present,
  }
}
