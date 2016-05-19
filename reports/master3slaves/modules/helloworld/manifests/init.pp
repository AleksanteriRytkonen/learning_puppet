class helloworld() {
	file {'/tmp/helloFromMaster':
		content => "hello friend\n",
	}
}
