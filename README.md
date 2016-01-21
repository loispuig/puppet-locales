# puppet-locales

#### Table of Contents

1. [Overview](#overview)
2. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)

## Overview

Sets locales on Debian based OS :

* Installs required package if needed
* Modifies the /etc/default/locale file content
* Modifies the /etc/locale.gen file content
* Executes locale-gen and locale-update commands

## Usage

```
include locales
```

or

```
class { 'locales':
	default_locale  => 'fr_FR.UTF-8',
	locales         => [ 'fr_FR.UTF-8 UTF-8', 'en_US.UTF-8 UTF-8' ],
}
```

Default values are

```
$locales = [ 'en_US.UTF-8 UTF-8', 'fr_FR.UTF-8 UTF-8', ],
$default_locale = 'fr_FR.UTF-8',
```

## Reference

* manifests/init.pp : Initiates the module, includes parameters and starts the package and config scripts.
* manifests/params.pp : Defines used parameters and related default values.
* manifests/package.pp : Installs required packages.
* manifests/config.pp : Sets locales.

## Limitations

Tested on Debian 8 using Puppet 3.7.  
Should work on any Debian and Ubuntu based OS.  
Puppet >= 3.3 required.