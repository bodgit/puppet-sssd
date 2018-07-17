RSpec.configure do |c|
  c.mock_with :mocha # using :rspec makes the augeas_spec blow up
end

require 'pathname'
dir = Pathname.new(__FILE__).parent
$LOAD_PATH.unshift(dir, File.join(dir, 'fixtures/modules/augeasproviders_core/spec/lib'), File.join(dir, '..', 'lib'))

require 'facter'
require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet-facts'
require 'augeas_spec'

unless RUBY_VERSION =~ /^1\.8/
  require 'simplecov'
  require 'coveralls'
end

include RspecPuppetFacts

add_custom_fact :service_provider, lambda { |os, facts| os =~ /-7-/ ? 'systemd' : 'init' }

RSpec.configure do |c|
  c.default_facts = { :dbus_startup_provider => 'init' }
end

dir = Pathname.new(__FILE__).parent

Puppet[:modulepath] = File.join(dir, 'fixtures', 'modules')
Puppet[:libdir] = File.join(Puppet[:modulepath], 'augeasproviders_core', 'lib')

at_exit { RSpec::Puppet::Coverage.report! }

unless RUBY_VERSION =~ /^1\.8/
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]
  SimpleCov.start do
    add_filter 'spec/'
  end
end
