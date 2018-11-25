# @!visibility private
class sssd::daemon {

  service { $::sssd::service_name:
    ensure     => $::sssd::service_ensure,
    enable     => $::sssd::service_enable,
    hasstatus  => true,
    hasrestart => true,
  }
}
