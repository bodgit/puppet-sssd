# @!visibility private
class sssd::params {

  case $::osfamily {
    'RedHat': {
      $conf_dir              = '/etc/sssd'
      $conf_file             = "${conf_dir}/sssd.conf"
      $dbus_package_name     = 'sssd-dbus'
      $package_name          = 'sssd'
      $service_name          = 'sssd'
      $socket_services       = ['nss', 'pam', 'sudo', 'autofs', 'ssh', 'pac', 'secrets'].reduce({}) |Hash $memo, SSSD::Type $service| {
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
      $use_socket_activation = $::service_provider ? {
        'systemd' => true,
        default   => false,
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
