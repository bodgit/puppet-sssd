Puppet::Type.type(:sssd_conf).provide(:augeas, :parent => Puppet::Type.type(:augeasprovider).provider(:default)) do
  desc ''

  default_file { '/etc/sssd/sssd.conf' }

  lens { 'Sssd.lns' }

  confine :feature => :augeas

  resource_path do |resource|
    section = resource[:section]
    setting = resource[:setting]
    "$target/target[. = '#{section}']/#{setting}"
  end

  def self.instances
    augopen do |aug|
      resources = []
      aug.match("$target/target/*[label()!='#comment']").each do |spath|
        section = aug.get("#{spath}/..")
        setting = path_label(aug, spath)
        value = aug.get(spath)
        entry = {
          :name    => "#{section}/#{setting}",
          :ensure  => :present,
          :section => section,
          :setting => setting,
          :value   => value,
        }
        resources << new(entry)
      end
      resources
    end
  end

  def create
    augopen! do |aug|
      section = resource[:section]
      setting = resource[:setting]
      aug.set("$target/target[. = '#{section}']", section)
      aug.set("$target/target[. = '#{section}']/#{setting}", resource[:value])
    end
  end

  def destroy
    augopen! do |aug|
      aug.rm('$resource')
      aug.rm('$target/target[count(*)=0]')
    end
  end

  attr_aug_accessor(:value, { :label => :resource })
end
