class apache($port, $user, $docroot) {
        package {"apache2":
                ensure => "installed",
        }
        service {"apache2":
                ensure => "running",
                enable => "true",
        }
	apache::vhost { 'kotisivu':
		port => $port,
		docroot => $docroot,
		user => $user,
		require => Package['apache2'],
	}
}

