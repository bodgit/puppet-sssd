require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'
require 'beaker/puppet_install_helper'
require 'beaker/module_install_helper'

hosts.each do |host|
  # Just assume the OpenBSD box has Puppet installed already
  if host['platform'] !~ /^openbsd-/i
    run_puppet_install_helper_on(host)
  end
end

install_module_on(hosts)
install_module_dependencies_on(hosts)
install_module_from_forge_on(hosts, 'bodgit/openldap',   '>=2.0.0 <3.0.0')
install_module_from_forge_on(hosts, 'trlinkin/nsswitch', '>=2.0.0 <3.0.0')

RSpec.configure do |c|
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  c.formatter = :documentation

  c.before :suite do
    hosts.each do |host|
      scp_to(host, File.join(proj_root, 'spec/fixtures/files/example.ldif'), '/root/example.ldif')
    end
  end
end
