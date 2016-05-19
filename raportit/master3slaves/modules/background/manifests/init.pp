class background($image) {
	file { '/usr/share/xfce4/backdrops/xubuntu-wallpaper.png':
		source => "puppet:///modules/background/$image",
	}
}
