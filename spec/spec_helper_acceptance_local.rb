require 'beaker/module_install_helper'

install_module_from_forge_on(hosts, 'bodgit/openldap',   '>=2.0.0 <3.0.0')
install_module_from_forge_on(hosts, 'trlinkin/nsswitch', '>=2.0.0 <3.0.0')

hosts.each do |host|
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  scp_to(host, File.join(proj_root, 'spec/fixtures/files/example.ldif'), '/root/example.ldif')
end
