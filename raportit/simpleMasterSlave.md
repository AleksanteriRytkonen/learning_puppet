###on master:
```
sudo apt-get -y install puppetmaster
sudo rm -r /var/lib/puppet/ssl

sudoedit /etc/puppet/puppet.conf
under master heading
[master]
dns_alt_names = puppet, master.local

sudo service puppetmaster start 
```
###on slaves(linux):
```
sudo apt-get -y install puppet

sudoedit /etc/puppet/puppet.conf
add new heading
[agent]
server = master.local

sudoedit /etc/default/puppet
START=yes

sudo service puppet restart
sudo puppet agent --enable
```
###on slaves(Windows)
```
Download the msi installer from [puppetlabs](https://downloads.puppetlabs.com/windows/?_ga=1.45444260.1484390264.1463402252)
Install it with defaults, except on the part where it asks for masters hostname, change the default to you're masters hostname.
For example on my linux slaves its master.local, but on windows for some odd reason its master.home
```
###on master:
```
sudo puppet cert --list
sudo puppet cert --sign nameofslave
```

Sources
[terokarvinen.com](http://terokarvinen.com/2012/puppetmaster-on-ubuntu-12-04)
