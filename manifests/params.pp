class locales::params {

	case $::osfamily {
		'debian': {
			$package           = 'locales'
			$default_file      = '/etc/default/locale'
			$locale_gen_cmd    = 'locale-gen'
			$locale_update_cmd = 'update-locale'
			$supported_locales  = '/usr/share/i18n/SUPPORTED'

			case $::lsbdistid {
				'Ubuntu': {
					$config_file = '/var/lib/locales/supported.d/local'
					case $::lsbdistcodename {
						'hardy': {
							$update_locale_pkg = 'belocs-locales-bin'
						}
						default: {
							$update_locale_pkg = 'libc-bin'
						}
					}
				}
				default: {
					$config_file = '/etc/locale.gen'
					$update_locale_pkg = false
				}
			}
		}
		default: {
			fail("Unsupported platform: ${::operatingsystem}")
		}
	}
}