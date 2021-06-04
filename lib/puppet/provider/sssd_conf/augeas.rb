Puppet::Type.type(:sssd_conf).provide(:augeas, parent: Puppet::Type.type(:augeasprovider).provider(:default)) do
  desc 'Uses Augeas API to update an sssd.conf setting.'

  default_file { '/etc/sssd/sssd.conf' }

  lens { 'Sssd.lns' }

  confine feature: :augeas

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
        value = aug.get(spath) || ''
        entry = {
          name:    "#{section}/#{setting}",
          ensure:  :present,
          section: section,
          setting: setting,
          value:   value,
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
      value   = resource[:value]
      aug.set("$target/target[. = '#{section}']", section)
      aug.touch("$target/target[. = '#{section}']/#{setting}")
      aug.set("$target/target[. = '#{section}']/#{setting}", value) unless value.eql?('')
    end
  end

  def destroy
    augopen! do |aug|
      aug.rm('$resource')
      aug.rm('$target/target[count(*)=0]')
    end
  end

  def value
    augopen! do |aug|
      aug.get('$resource') || ''
    end
  end

  def value=(v)
    augopen! do |aug|
      if v.eql?('')
        aug.clear('$resource')
      else
        aug.set('$resource', v)
      end
    end
  end
end
