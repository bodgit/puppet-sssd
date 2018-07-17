# @!visibility private
class sssd::daemon {

  service { $::sssd::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
