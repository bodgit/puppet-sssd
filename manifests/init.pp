# Manage SSSD.
#
# @example Declaring the class
#   include ::sssd
#   ::sssd::service { 'nss': }
#   ::sssd::domain { 'example.com':
#     id_provider => 'ldap',
#     ...
#   }
#
# @param conf_dir
# @param conf_file
# @param package_name
# @param service_name
# @param socket_services
# @param use_socket_activation
# @param debug
# @param debug_level
# @param debug_timestamps
# @param debug_microseconds
# @param config_file_version
# @param reconnection_retries
# @param re_expression
# @param full_name_format
# @param try_inotify
# @param krb5_rcache_dir
# @param user
# @param default_domain_suffix
# @param override_space
# @param certificate_verification
# @param disable_netlink
# @param enable_files_domain
# @param domain_resolution_order
#
# @see puppet_classes::sssd::dbus ::sssd::dbus
# @see puppet_defined_types::sssd::domain ::sssd::domain
# @see puppet_defined_types::sssd::service ::sssd::service
#
# @since 1.0.0
class sssd (
  Stdlib::Absolutepath                                                  $conf_dir                 = $::sssd::params::conf_dir,
  Stdlib::Absolutepath                                                  $conf_file                = $::sssd::params::conf_file,
  String                                                                $package_name             = $::sssd::params::package_name,
  String                                                                $service_name             = $::sssd::params::service_name,
  Hash[SSSD::Type, Variant[String, Array[String, 1]]]                   $socket_services          = $::sssd::params::socket_services,
  Boolean                                                               $use_socket_activation    = $::sssd::params::use_socket_activation,
  # options for any section
  Optional[Integer[0]]                                                  $debug                    = undef,
  Optional[Integer[0]]                                                  $debug_level              = undef,
  Optional[Boolean]                                                     $debug_timestamps         = undef,
  Optional[Boolean]                                                     $debug_microseconds       = undef,
  # options for [sssd] section
  Integer[2]                                                            $config_file_version      = 2,
  Optional[Integer[0]]                                                  $reconnection_retries     = undef,
  Optional[String]                                                      $re_expression            = undef,
  Optional[String]                                                      $full_name_format         = undef,
  Optional[Boolean]                                                     $try_inotify              = undef,
  Optional[Variant[Stdlib::Absolutepath, Enum['__LIBKRB5_DEFAULTS__']]] $krb5_rcache_dir          = undef,
  Optional[String]                                                      $user                     = undef,
  Optional[String]                                                      $default_domain_suffix    = undef,
  Optional[String]                                                      $override_space           = undef,
  Optional[Array[SSSD::Certificate::Verification, 1]]                   $certificate_verification = undef,
  Optional[Boolean]                                                     $disable_netlink          = undef,
  Optional[Boolean]                                                     $enable_files_domain      = undef,
  Optional[Array[String, 1]]                                            $domain_resolution_order  = undef,
) inherits ::sssd::params {

  contain ::sssd::install
  contain ::sssd::config
  contain ::sssd::daemon

  Class['::sssd::install'] ~> Class['::sssd::config']
    ~> Class['::sssd::daemon']
}
