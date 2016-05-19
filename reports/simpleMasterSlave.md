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
Download the msi installer from [puppetlabs](https://downloads.puppetlabs.com/windows/?_ga=1.45444260.1484390264.1463402252)
```
Install it with defaults, except on the part where it asks for masters hostname,
change the default to you're masters hostname.
For example on my linux slaves its master.local, but on windows for some odd reason its master.home
```
###on master:
```
sudo puppet cert --list
sudo puppet cert --sign nameofslave
```
Picture where is 4 different virtualbox machines, 3 linux and 1 windows, and all of the slaves have gotten something from puppet.
Notice that even though on windows the computers name is written all uppercase, it needs to be the opposite on puppet manifest so the name 
needs to be all lowercase.
![ScreenShot](/reports/images/master2linux1winslave.png)

#Sources
[terokarvinen.com](http://terokarvinen.com/2012/puppetmaster-on-ubuntu-12-04)
  
[puppet.com](https://docs.puppet.com/pe/latest/install_windows.html)
