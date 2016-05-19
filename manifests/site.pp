node default {
	$user = 'allu'
	class {'apache':
		port => '80',
		user => "$user",
		docroot => "/home/$user/public_html",
	}
}
