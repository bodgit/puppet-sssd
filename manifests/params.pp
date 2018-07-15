# @!visibility private
class sssd::params {

  case $::osfamily {
    'RedHat': {
      $conf_dir          = '/etc/sssd'
      $conf_file         = "${conf_dir}/sssd.conf"
      $dbus_package_name = 'sssd-dbus'
      $package_name      = 'sssd'
      $service_name      = 'sssd'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
