#
class sssd::config {

  $user = $::sssd::user

  $owner = $user ? {
    undef   => 0,
    default => $user,
  }

  file { $::sssd::conf_dir:
    ensure => directory,
    owner  => $owner,
    group  => 0,
    mode   => '0611',
  }

  file { $::sssd::conf_file:
    ensure => file,
    owner  => $owner,
    group  => 0,
    mode   => '0600',
  }

  if $user and defined(User[$user]) {
    User[$user] -> File[$::sssd::conf_dir]
    User[$user] -> File[$::sssd::conf_file]
  }

  Sssd_conf {
    target => $::sssd::conf_file,
  }

  resources { 'sssd_conf':
    purge => true,
  }

  $config = delete_undef_values({
    'debug_level'           => $::sssd::debug_level,
    'debug_timestamps'      => $::sssd::debug_timestamps,
    'debug_microseconds'    => $::sssd::debug_microseconds,
    'config_file_version'   => $::sssd::config_file_version,
    'reconnection_retries'  => $::sssd::reconnection_retries,
    're_expression'         => $::sssd::re_expression,
    'full_name_format'      => $::sssd::full_name_format,
    'try_inotify'           => $::sssd::try_inotify,
    'krb5_rcache_dir'       => $::sssd::krb5_rcache_dir,
    'user'                  => $user,
    'default_domain_suffix' => $::sssd::default_domain_suffix,
    'override_space'        => $::sssd::override_space,
    'services'              => '',
    'domains'               => '',
  })

  $titles = prefix(keys($config), 'sssd/')
  $values = parsejson(inline_template('<%= @config.values.map { |x| { "value" => x } }.to_json %>'))

  create_resources(sssd_conf, hash(zip($titles, $values)), {'ensure' => 'present'})

  datacat_collector { 'sssd services':
    template_body   => '<%= @data["service"].sort.join(", ") %>',
    target_resource => Sssd_conf['sssd/services'],
    target_field    => 'value',
    before          => Sssd_conf['sssd/services'],
  }

  datacat_collector { 'sssd domains':
    template_body   => '<%= @data["domain"].sort.join(", ") %>',
    target_resource => Sssd_conf['sssd/domains'],
    target_field    => 'value',
    before          => Sssd_conf['sssd/domains'],
  }
}
