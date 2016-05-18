### Käytetty laitteisto
``` 
Käyttöjärjestelmä: Xubuntu 16.04 LTS 64bit
cpu: amd fx-8120
näytönohjain nvidia: geforce gtx 970
DDR3: 16GB
```


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
![ScreenShot](/images/apassiPuppet.png)

##Edit:
Lisäsin defined typellä virtualhostin apacheen joka löytyy seuraavasta linkistä: [vhostmoduuli](https://github.com/AleksanteriRytkonen/learning_puppet/tree/master/modules/apache)
Muokkasin myös `/etc/hosts` tiedostoa ja lisäsin sinne seuraavanlaisen rivin
`10.0.2.15      allu.aleksanterirytkonen.com` ip osoitteena tietysti koneen oma ip.
Tämän jälkeen korjasin vielä templatessa olleen typon (yksi '>' merkki puuttui) ja alkoi homma pelittää.
![ScreenShot](/images/apachevhost.png)

##Lähteet
[terokarvinen.com](http://terokarvinen.com/2016/aikataulu-%E2%80%93-linuxin-keskitetty-hallinta-ict4tn011-9-loppukevat-2016#comments)

[puppetcookbook](http://www.puppetcookbook.com/)
