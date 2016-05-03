**Tehdään yksinkertainen moduuli joka asentaa apachen ja
korvaa apachen vakio index.html:n sisällön**.
aloitetaan menemällä `cd /etc/puppet/modules` ja luodaan sinne vielä
apache ja manifests kansiot komennolla:
`mkdir -p apache/manifests/`
Sirrytään kyseiseen kansioon ja luodaan init.pp tiedosto
komennolla `sudoedit init.pp`, jonka sisälle tulee seuraava
sisältö. 
