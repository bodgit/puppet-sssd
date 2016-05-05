require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'

hosts.each do |host|
  install_puppet
end

RSpec.configure do |c|
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  c.formatter = :documentation

  c.before :suite do
    hosts.each do |host|
      puppet_module_install(:source => proj_root, :module_name => 'sssd')
      on host, puppet('module','install','puppetlabs-stdlib'),                 { :acceptable_exit_codes => [0,1] }
      on host, puppet('module','install','richardc-datacat'),                  { :acceptable_exit_codes => [0,1] }
      on host, puppet('module','install','herculesteam-augeasproviders_core'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module','install','bodgit-dbus'),                       { :acceptable_exit_codes => [0,1] }
      on host, puppet('module','install','bodgit-openldap'),                   { :acceptable_exit_codes => [0,1] }
      on host, puppet('module','install','trlinkin-nsswitch'),                 { :acceptable_exit_codes => [0,1] }
      scp_to(host, File.join(proj_root, 'spec/fixtures/files/example.ldif'), '/root/example.ldif')
    end
  end
end
