**Tehdään yksinkertainen moduuli joka asentaa apachen ja
korvaa apachen vakio index.html:n sisällön**.
aloitetaan menemällä `cd /etc/puppet/modules` ja luodaan sinne vielä
apache ja manifests kansiot komennolla:
`mkdir -p apache/manifests/`
Sirrytään kyseiseen kansioon ja luodaan init.pp tiedosto
komennolla `sudoedit init.pp`, jonka sisälle tulee seuraava
sisältö:
```
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
```
Tämän jälkeen voidaankin kyseisessä kansiossa kirjoittaa
`puppet apply -e 'class{"apache": }'`
Minkä jälkeen apache asentuu jos se ei ole jo asentunut, käynnistyy ja korvaa
vakio index.html:n sisällön tekstillä Jeps!
![ScreenShot](learning_puppet/apassiPuppet.png)
