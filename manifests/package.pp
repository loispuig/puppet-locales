class locales::package inherits locales {

	case $::osfamily {
		'redhat', 'debian': {
			$package = 'locales'
		}
	}

	package { $package:
		ensure => 'present',
	}
}