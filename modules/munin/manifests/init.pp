class munin {
	package { ['munin', 'munin-node']:
		ensure => installed,
	}
}
