class apache {
        package {"apache2":
                ensure => "installed",
        }
        file { "/var/www/html/index.html":
                content => "Jeps!\n",
        }
        service {"apache2":
                ensure => "running",
                enable => "true",
        }
}

