#!/bin/bash
# ******************************************
# Script : Ogars-Bot-Blocker.
# Author : RAW A.K.A Jasht'sSerie.
# OS     : Ubuntu 14.04
# ******************************************

# Wrote Server Port which isn't protected. If you won't don't touch isn't problem!
sp=(443)

# Public Port which you will connect to play. protected.
pp=(61)

# Wrote a domain or subdomain if you want if not don't touch!
domain=(default_server)


#Start. if you don't know what are you doing don't touch other line's.
sudo apt-get update; apt-get upgrade -y
sudo apt-get install ruby zip unzip curl nano wget screen -y
cd /opt
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
rm -Rf master.zip
cd lolcat-master/
gem install lolcat
cd ~/
clear 
echo "Let's Start" | lolcat -a -s 100
sudo apt-get install git libssl-dev openssl -y | lolcat -a -s 100
sudo apt-get install dnsutils build-essential -y | lolcat -a -s 100
clear
sudo add-apt-repository ppa:nginx/stable
sudo apt-get update -y | lolcat -a -s 100
sudo apt-get install nginx -y | lolcat -a -s 100
service nginx restart | lolcat -a -s 100
apt-get install geoip-database libgeoip1 -y
mv /usr/share/GeoIP/GeoIP.dat /usr/share/GeoIP/GeoIP.dat_bak
cd /usr/share/GeoIP/
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
gunzip GeoIP.dat.gz
mv /etc/nginx/nginx.conf /etc/nginx/nginx.oldfile.old.ok
cd /etc/nginx/
wget https://raw.githubusercontent.com/systemroot/ogars-bots-blocker/master/etc/nginx/nginx.conf
cd /etc/nginx/sites-enabled/
rm -Rf default
echo '
server {
        listen             ppub;
        server_name        domainn;
        access_log /var/log/nginx/monitor_log combined;
        location / {
        if ($http_user_agent ~ "WOW64" ) {
           set $browser-version outdated;
        }
        if ($http_user_agent ~ "rv:30.0" ) {
           set $browser-version outdated;
        }
        if ($http_user_agent ~ "Firefox/30.0" ) {
           set $browser-version outdated;
        }
        if ($browser-version = outdated) {
           return 444;
        }
        access_log /var/log/nginx/monitor_log combined;
        proxy_pass         http://localhost:srvpp;
        proxy_set_header   X-Real-IP $remote_addr;
        proxy_set_header   Host $host;
        proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_http_version 1.1;
        proxy_set_header   Upgrade $http_upgrade;
        proxy_set_header   Connection "upgrade";
        }
}
' > /etc/nginx/sites-enabled/default
sed -i 's@        listen             ppub;@        listen             '$pp';@g' /etc/nginx/sites-enabled/default
sed -i 's@        server_name        domainn;@        server_name        '$domain';@g' /etc/nginx/sites-enabled/default
sed -i 's@        proxy_pass         http://localhost:srvpp;@        proxy_pass         http://localhost:'$sp';@g' /etc/nginx/sites-enabled/default

clear
service nginx restart
echo "Work Done!" | lolcat -a -s 100
echo "Start Server node index.js" | lolcat -a -s 100
ip="$(curl api.ipify.org)"
echo "Play On http://old.ogarul.io/?ip=${ip}:$pp" | lolcat -a -s 100
