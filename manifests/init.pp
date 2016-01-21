# == Class: locales
#
# Full description of class timezone here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'timezone':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class locales (
	$locales = [ 'en_US.UTF-8 UTF-8', 'fr_FR.UTF-8 UTF-8', ],
	$default_locale = 'fr_FR.UTF-8',

) inherits locales::params {

	anchor { 'locales::begin': } ->
		class { '::locales::package': } ->
		class { '::locales::config': } ->
	anchor { 'locales::end': }
}
