Puppet::Type.newtype(:sssd_conf) do
  @doc = ''

  ensurable do
    defaultvalues
  end

  newparam(:name) do
  end

  newparam(:section) do
    isnamevar
    defaultto 'sssd'
  end

  newparam(:setting) do
    isnamevar
  end

  def self.title_patterns
    identity = lambda { |x| x }
    comma_split = lambda { |x| x.split(',') }
    [
      [
        /^(\S+)\/(\S+)$/,
        [
          [ :section, identity ],
          [ :setting, identity ],
        ]
      ],
      [
        /(.*)/,
        [
          [ :name, identity ],
        ]
      ]
    ]
  end

  newproperty(:value) do
    munge do |value|
      value.to_s
    end
  end

  newparam(:target) do
  end

  autorequire(:file) do
    self[:target]
  end
end
