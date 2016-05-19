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
###on master:
```
sudo puppet cert --list
sudo puppet cert --sign nameofslave
```

