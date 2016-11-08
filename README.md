# ogars-bots-blocker

1. Ogars = OgarUL, MultiOgar, Ogar Official.

2. Bots = Minions who someone add in your server.

3. Bocker = Currently Testing my stuff to block 2. from 1. Not just this but some more security if this way will work.

4. It's Done!

This pretty easy can deny bot's who come from different ip's (sock's proxy's) on your server!

First create your server and run it in some port not default port. 

example my server is running on port :6767

Now install nginx

ubuntu : ``*apt-get -y install nginx; service nginx start*``

CentOS : ``*yum -y install nginx; service nginx restart*``

``*cd /etc/nginx/sites-available/*``

``*nano default*``

Delete all line's into that, and put those https://github.com/systemroot/ogars-bots-blocker/blob/master/site.conf

but replace domain "ws.pandadev.net"

you can read that listen 88; so that will be your server port from now!

you can read  proxy_pass http://localhost:6767; there is my server running so replace just 6767 with your server port!

now wrote ``*nginx -t*`` on terminal, if you can see this 

`
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
`

Then you're ok! ``*service nginx restart*``

Now start server and connect it on "domainename" example "ws.pandadev.net" and your port example :88, so "ws.pandadev.net:88"
or directly IP:88 


TO KNOW!
Bot's can't come from port 88. but they will come if someone find your real server port. but if you use nginx in a different server and do proxy_pass http://yourOgarServerIp:6767;
then no one will be able to find your real server port!.
what if anyone will add bots on port 88? then upload /var/log/nginx/access_log file somewhere get the link and post it here on a issue! then i'll add a new rule. 

This can be more better if anyone of those dev's who developed ogarul, multiogar, or ogar use "nodejs user-agent" so we can block directly without doing this stuf with nginx! with those user-agent we also can block every proxy which can be used for spam!. So if anyone of those dev's is reading this, then bruh take some care :D.

#Auto Installers.

1. - Ubuntu 14.04 , with All Ogar Versions. (Ogar, Ogarul, Multiogar, MultiOgar By Megabyte918)

First change the port which you was using for your server then start this.

$ **``wget https://raw.githubusercontent.com/systemroot/ogars-bots-blocker/master/ubuntu-mmode.sh``**

$ **``chmod +x ubuntu-mmode.sh``**

$ **``nano ubuntu-mmode.sh``**

Info. 

Wrote **Server Port** > The private port which isn't suggested to be for public. isn't protected.

Wrote **Stats Port** > wWhatever you want.

Wrote **Public Port** > Port Which you will connect to play which is protected.

then

$ **``./ubuntu-mmode.sh``**

You Are Done! if you change **server game port** then change this too **/etc/nginx/sites-enabled/default** replace port in **proxy_pass** with your new game port.
and do one restart **``service nginx restart``**
