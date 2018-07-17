# @!visibility private
class sssd::dbus::install {

  package { $::sssd::dbus::package_name:
    ensure => present,
  }
}
