Puppet::Type.newtype(:sssd_conf) do
  @doc = 'Manages settings in an SSSD sssd.conf file.

The resource name can be used as a shortcut for specifying the section and
setting parameters by using the form `<section>/<setting>` otherwise it can be
left as a normal string.'

  ensurable

  newparam(:name) do
    desc 'The name of the section and setting separated by `/`, or a unique
string.'
  end

  newparam(:section) do
    desc 'The section in the sssd.conf file for the setting, defaults to the
global [sssd] section.'
    isnamevar
    defaultto 'sssd'
  end

  newparam(:setting) do
    desc 'The setting in the sssd.conf file to manage.'
    isnamevar
  end

  def self.title_patterns
    [
      [
        /^(\S+)\/(\S+)$/,
        [
          [ :section ],
          [ :setting ],
        ]
      ],
      [
        /(.*)/,
        [
          [ :name ],
        ]
      ]
    ]
  end

  newproperty(:value) do
    desc 'Value to change the setting to.'
    munge do |value|
      value.to_s
    end
  end

  newparam(:target) do
    desc 'The file in which to store the settings, defaults to
`/etc/sssd/sssd.conf`.'
  end

  autorequire(:file) do
    self[:target]
  end
end
