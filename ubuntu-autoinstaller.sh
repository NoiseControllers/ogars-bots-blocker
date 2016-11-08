#!/bin/bash
# ******************************************
# Script : Ogars-Bot-Blocker.
# Author : RAW A.K.A Jasht'sSerie.
# OS     : Ubuntu 14.04
# ******************************************

# Wrote Server Port which isn't protected.
sp=(6666)

# Stats Port.
stp=(6661)

# Public Port which you will connect to play. protected.
pp=(6969)

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
curl -sL https://deb.nodesource.com/setup_4.x | sudo bash - 
sudo apt-get install nodejs -y | lolcat -a -s 100
clear
echo "Installing Node 5.9"
npm cache clean -f | lolcat -a -s 100
npm install -g n | lolcat -a -s 100
n 5.9.0 | lolcat -a -s 100
sudo ln -sf /usr/local/n/versions/node/5.9.0/bin/node /usr/bin/node
npm config set prefix /usr/local
clear
cd ~/
mkdir game
cd game/
git clone https://github.com/AJS-development/Ogar-unlimited.git | lolcat -a -s 100
cd Ogar-unlimited/src
npm install
sed -i "/serverPort = 443/c\serverPort = $sp" ~/game/Ogar-unlimited/src/settings/advConfig.ini
sed -i "/serverStatsPort = 88/c\serverStatsPort = $stp" ~/game/Ogar-unlimited/src/settings/advConfig.ini
clear
sudo apt-get install nginx -y | lolcat -a -s 100
service nginx restart | lolcat -a -s 100
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
echo "cd ~/game/Ogar-unlimited/src" | lolcat -a -s 100
echo "Start Server node index.js" | lolcat -a -s 100
ip="$(curl api.ipify.org)"
echo "Play http://old.ogarul.io/?ip=${ip}:$pp" | lolcat -a -s 100
