define apache::vhost ($port, $user, $docroot) {
	file { '/var/www/html/index.html':
		ensure => 'absent',
		notify => Exec['dissite'],
	}
	exec { 'dissite':
		path => [ '/bin', '/usr/bin', '/usr/sbin' ],
		command => "a2dissite 000-default.conf",
		refreshonly => true
	}
	file { "/home/$user/public_html":
		ensure => 'directory',
		owner => "$user",
		mode => '0775',
	}
	file { "/etc/apache2/sites-available/$user.conf":
		content => template('apache/vhost.conf.erb'),
		notify => Exec['ensite'],
	}
	file { "/home/$user/public_html/index.html":
		ensure => 'file',
		content => 'Hei maailma\n',
	}
	exec { 'ensite':
                path => [ '/bin', '/usr/bin', '/usr/sbin' ],
                command => "a2ensite $user.conf",
                refreshonly => true,
                notify => Service['apache2'],
        }
}
