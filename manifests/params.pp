# @!visibility private
class sssd::params {

  $conf_dir          = '/etc/sssd'
  $conf_file         = "${conf_dir}/sssd.conf"
  $dbus_package_name = 'sssd-dbus'
  $service_name      = 'sssd'
  $socket_services   = ['nss', 'pam', 'sudo', 'autofs', 'ssh', 'pac', 'secrets'].reduce({}) |Hash $memo, SSSD::Type $service| {
    $memo + {
      $service => $service ? {
        'pam'   => [
          "sssd-${service}.socket",
          "sssd-${service}-priv.socket",
        ],
        default => "sssd-${service}.socket",
      }
    }
  }
  case $facts['os']['family'] {
    'RedHat': {
      $package_name          = 'sssd'
      $use_socket_activation = $facts['service_provider'] ? {
        'systemd' => true,
        default   => false,
      }
    }
    'Debian': {
      $package_name          = ['sssd', 'libpam-sss', 'libnss-sss']
      $use_socket_activation = $facts['service_provider'] ? {
        'systemd' => true,
        default   => false,
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${facts['os']['family']} based system.")
    }
  }
}
