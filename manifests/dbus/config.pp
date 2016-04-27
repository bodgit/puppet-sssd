#
class sssd::dbus::config {

  ::dbus::system { 'org.freedesktop.sssd.infopipe':
    content => file('sssd/org.freedesktop.sssd.infopipe.conf'),
  }

  ::sssd::service { 'ifp':
    debug_level          => $::sssd::dbus::debug_level,
    debug_timestamps     => $::sssd::dbus::debug_timestamps,
    debug_microseconds   => $::sssd::dbus::debug_microseconds,
    timeout              => $::sssd::dbus::timeout,
    reconnection_retries => $::sssd::dbus::reconnection_retries,
    fd_limit             => $::sssd::dbus::fd_limit,
    client_idle_timeout  => $::sssd::dbus::client_idle_timeout,
    force_timeout        => $::sssd::dbus::force_timeout,
    offline_timeout      => $::sssd::dbus::offline_timeout,
    subdomain_inherit    => $::sssd::dbus::subdomain_inherit,
    allowed_uids         => $::sssd::dbus::allowed_uids,
    user_attributes      => $::sssd::dbus::user_attributes,
    wildcard_limit       => $::sssd::dbus::wildcard_limit,
  }
}
