#
# validate_sssd_search_base.rb
#

module Puppet::Parser::Functions
  newfunction(:validate_sssd_search_base, :doc => <<-EOS
    Validate that all passed values are SSSD search bases. Abort catalog
    compilation if any value fails this check.
    EOS
  ) do |arguments|

    raise(Puppet::ParserError, 'validate_sssd_search_base(): Wrong number of ' +
      "arguments given (#{arguments.size} for 1)") if arguments.size != 1

    # search_base[?scope?[filter][?search_base?scope?[filter]]*]
    re = /
      ^
      [^?]+
      (?:
        \?
        (?:base|onelevel|subtree)
        \?
        [^?]*
        (?:
          \?
          [^?]+
          \?
          (?:base|onelevel|subtree)
          \?
          [^?]*
        )*
      )?
      $
    /x

    item = arguments[0]

    unless item.is_a?(Array)
      item = [item]
    end

    if item.size == 0
      raise(Puppet::ParseError, 'validate_sssd_search_base(): Requires an ' +
        'array with at least 1 element')
    end

    item.each do |i|
      unless i.is_a?(String)
        raise(Puppet::ParseError, 'validate_sssd_search_base(): Requires ' +
          'either an array or string to work with')
      end

      unless i =~ re
        raise(Puppet::ParseError, "#{i.inspect} is not a valid SSSD search " +
          'base')
      end

      i.split('?').each_slice(3) do |dn,scope,filter|
        begin
          function_validate_ldap_dn([dn])
          if not filter.nil? and filter.length > 0
            function_validate_ldap_filter([filter])
          end
        rescue
          raise(Puppet::ParseError, "#{i.inspect} is not a valid SSSD " +
            'search base')
        end
      end
    end
  end
end
