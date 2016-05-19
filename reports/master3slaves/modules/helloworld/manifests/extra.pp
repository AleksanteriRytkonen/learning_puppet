define helloworld::extra($sisalto) {
	file { '/tmp/helloFromMaster2':
		content => $sisalto,
	}
}		 
