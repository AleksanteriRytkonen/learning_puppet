class public_html {
	exec { 'mkdir':
		command => '/bin/mkdir /etc/skel/public_html',
		creates => '/etc/skel/public_html',
	}
	exec { 'touch':
		command => '/bin/touch /etc/skel/public_html/testi.html',
		creates => '/etc/skel/public_html/testi.html',
		require => Exec['mkdir'],
	}	
	file {"/etc/skel/public_html/testi.html":
		content => "Testi html\n",
		require => Exec['touch'],
	}
}
