class locales::config inherits locales {

	file { $config_file:
		content => inline_template('<%= @locales.join("\n") + "\n" %>'),
    }

    file { $default_file:
		content => template("locales/locale.erb"),
		notify  => Exec['locale-update'],
	}

	exec { 'locale-gen':
		command     => $locale_gen_cmd,
		refreshonly => true,
		subscribe   => File[$config_file],
		path        => ['/usr/local/bin', '/usr/bin', '/bin', '/usr/local/sbin', '/usr/sbin', '/sbin'],
		require     => Package[$package],
		#locale-gen with all locales may take a very long time
		timeout     => 900,
	}

	exec { 'locale-update':
		command     => $locale_update_cmd,
		refreshonly => true,
		subscribe   => File[$default_file],
		path        => ['/usr/local/bin', '/usr/bin', '/bin', '/usr/local/sbin', '/usr/sbin', '/sbin'],
	}
}