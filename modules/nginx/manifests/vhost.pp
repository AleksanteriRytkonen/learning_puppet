define nginx::vhost ($site_name, $site_domain) {
	 file { '/etc/nginx/sites-enabled/kissakuvat.conf':
                content => template('nginx/vhost.conf.erb'),
                notify => Service['nginx'],
        }
}
