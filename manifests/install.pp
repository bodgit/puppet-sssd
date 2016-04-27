#
class sssd::install {

  package { $::sssd::package_name:
    ensure => present,
  }
}
