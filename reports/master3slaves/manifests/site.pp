node orja1 {
	$image = 'orja1.png'
	class {'orja2':}
	class {'background':
		image => "$image",
	}	
}
node orja2 {
	$image = 'orja2.png'
	class {'background':
		image => "$image",
	}
}
node desktop-fr96jag {
	class {'hellowin':}
}
