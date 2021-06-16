# sssd

[![Build Status](https://img.shields.io/github/workflow/status/bodgit/puppet-sssd/Test)](https://github.com/bodgit/puppet-sssd/actions?query=workflow%3ATest)
[![Codecov](https://img.shields.io/codecov/c/github/bodgit/puppet-sssd)](https://codecov.io/gh/bodgit/puppet-sssd)
[![Puppet Forge version](http://img.shields.io/puppetforge/v/bodgit/sssd)](https://forge.puppetlabs.com/bodgit/sssd)
[![Puppet Forge downloads](https://img.shields.io/puppetforge/dt/bodgit/sssd)](https://forge.puppetlabs.com/bodgit/sssd)
[![Puppet Forge - PDK version](https://img.shields.io/puppetforge/pdk-version/bodgit/sssd)](https://forge.puppetlabs.com/bodgit/sssd)

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with sssd](#setup)
    * [Beginning with sssd](#beginning-with-sssd)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This module will install the SSSD packages, configure any services and domains,
and optionally configure the D-Bus system service.

CentOS, RHEL, Scientific and Oracle Enterprise Linux is supported using Puppet
5 or later.

## Setup

### Beginning with sssd

You need to configure at least one domain for SSSD to start up so the bare
minimum would be:

```puppet
include ::sssd
::sssd::domain { 'example.com':
  id_provider => 'ldap',
  ...
}
```

## Usage

Configure SSSD to use LDAP for NSS:

```puppet
class { '::sssd':
  domains  => {
    'example.com' => {
      'id_provider'           => 'ldap',
      'ldap_schema'           => 'rfc2307',
      'ldap_uri'              => ['ldap://192.0.2.1'],
      'ldap_search_base'      => 'dc=example,dc=com',
      'ldap_tls_reqcert'      => 'never',
      'ldap_id_use_start_tls' => false,
      'ldap_default_bind_dn'  => 'cn=Manager,dc=example,dc=com',
      'ldap_default_authtok'  => 'secret',
    },
  },
  services => {
    'nss' => {},
  },
}

class { '::nsswitch':
  passwd => ['files', 'sss'],
  shadow => ['files', 'sss'],
  group  => ['files', 'sss'],
}

Class['::sssd'] -> Class['::nsswitch']
```

Extend the above example to also make the SSSD data available over D-Bus:

```puppet
include ::dbus
include ::sssd
::sssd::service { 'nss': }
::sssd::domain { 'example.com':
  id_provider           => 'ldap',
  ldap_schema           => 'rfc2307',
  ldap_uri              => ['ldap://192.0.2.1'],
  ldap_search_base      => 'dc=example,dc=com',
  ldap_tls_reqcert      => 'never',
  ldap_id_use_start_tls => false,
  ldap_default_bind_dn  => 'cn=Manager,dc=example,dc=com',
  ldap_default_authtok  => 'secret',
}
include ::sssd::dbus

class { '::nsswitch':
  passwd => ['files', 'sss'],
  shadow => ['files', 'sss'],
  group  => ['files', 'sss'],
}

Class['::sssd'] -> Class['::nsswitch']
```

## Reference

The reference documentation is generated with
[puppet-strings](https://github.com/puppetlabs/puppet-strings) and the latest
version of the documentation is hosted at
[https://bodgit.github.io/puppet-sssd/](https://bodgit.github.io/puppet-sssd/)
and available also in the [REFERENCE.md](https://github.com/bodgit/puppet-postfix/blob/main/REFERENCE.md).

## Limitations

This module takes the (somewhat laborious) approach of creating parameters for
each `sssd.conf` setting rather than just pass in a large hash of settings
which should result in more control.

Any setting that accepts the boolean `TRUE`/`FALSE` values is mapped to a
native Puppet boolean type. Any multi-valued setting accepts an array of
values.

Currently almost all parameters are optional, the only mandatory parameter is
that of the identity provider (`id_provider`) for the `sssd::domain` defined
type. This may change in the future if the logic becomes more obvious.

This module has been built on and tested against Puppet 5 and higher.

The module has been tested on:

* Red Hat/CentOS Enterprise Linux 6/7

## Development

The module relies on [PDK](https://puppet.com/docs/pdk/1.x/pdk.html) and has
both [rspec-puppet](http://rspec-puppet.com) and
[beaker-rspec](https://github.com/puppetlabs/beaker-rspec) tests. Run them
with:

```
$ bundle exec rake spec
$ PUPPET_INSTALL_TYPE=agent PUPPET_INSTALL_VERSION=x.y.z bundle exec rake beaker:<nodeset>
```

Please log issues or pull requests at
[github](https://github.com/bodgit/puppet-sssd).
