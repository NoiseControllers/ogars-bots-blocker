# ogars-bots-blocker

1. **Ogars**  = ``All Versions Of Agario Private Servers.``

2. **Bots**   = ``Minions who someone add in your server.``

3. **Bocker** = ``Currently Testing my stuff to block 2. from 1. Not just this but some more security if this way will work.``

4. **``It's Done!``**

This isn't a nodejs script. This is a port forward with nginx on linux OS's with security rules.
No one can found the real server port. because port scanners doesn't detect websocket port directly.

**``What this will do?``**

This will forward example your real public server port 69 to your server port which you are running on gameconfing.js 443.
you need to use a different port not 443!.
And this will scan On Connect all those who connect to your server.

**``And will not allow to connect on server more than 1 time. on the same time``** // To Stop Powerups.
When i say "will disallow.." that doesn't mean will disallow you to re'join on server till you die in game.
isn't needed to wait you can refresh page as much as you want you will be able to connect directly in a sec.
but how this work o.O ?!
well open 2 tabs on chrome and on both try to connect your server. u'll see what i'm talking.


**``Will block old browser version.``** // To Stop PolarsBots.

**``Will Drop Connection For those who take too much time to join.``** // Only proxy's/Socks Want too much time.

**``Will limit Bandwidth to 5MB/s. If SomeOne Go More Than 5MB/s Session Will Be Purged. Player Will Get Disconnect. 
but player can join again in moment.``**

**``Will Deny China Country. And Anonymous Proxy's.``**

**``And more..``**

You can change those however you want. Nginx work with Windows 2. But i don't Own VPS windows at this time so i can't explain installation steps...

#Auto Installers.

1. - Ubuntu 14.04 , with All Ogar Versions. (Ogar, Ogarul, Multiogar, MultiOgar By Megabyte918)

First change the port which you was using for your server then start this.

$ **``wget https://raw.githubusercontent.com/systemroot/ogars-bots-blocker/master/ubuntu-mmode.sh``**

$ **``chmod +x ubuntu-mmode.sh``**

$ **``nano ubuntu-mmode.sh``**

Info. 

Wrote **Server Port** > The private port which isn't suggested to be for public. isn't protected.

Wrote **Public Port** > Port Which you will connect to play which is protected.

then

$ **``./ubuntu-mmode.sh``**

You Are Done! if you change **server game port** then change this too **/etc/nginx/sites-enabled/default** replace port in **proxy_pass** with your new game port.
and do one restart **``service nginx restart``**

-
# Deny Permanently!
The only problem with this way is because if anyone will try to scan your ports one by one can find your real server port!
the chance about this from 100, is 20-25 xP. 
But there is another way which you can do. you can set up your server with nginx as i have wrote. after that you can conntact me jump here https://github.com/systemroot/ogars-bots-blocker/issues/1 it's my discord chat and contact me and send me your server ip:port the port which you wroted on nginx! and i will send you one ip:port which you can access your server that is a proxy and no one will be able to scan your ip for open ports anymore (: . 
The problem here si because i haven't found how to put fake ip for gametrackers example for ogar-tracker.tk ! 
btw i'll wrote if i found it.

-
# Add Fake port for gametrackers. 
**This is only for Multiogar-edited, Multiogar.**

First open **gameserver.ini**

Wrote somewhere this **customPort = 69** that **69** should be your port which is used with nginx to forward players to real server port ex 443.

Now open **GameServer.js** And below this https://github.com/Megabyte918/MultiOgar-Edited/blob/master/src/GameServer.js#L58

Wrote New line **customPort = 69,**

Scroll down find trackers content. 

And change this https://github.com/Megabyte918/MultiOgar-Edited/blob/master/src/GameServer.js#L1351

**port: this.config.serverPort,** => **port: this.config.customPort,**

change this https://github.com/Megabyte918/MultiOgar-Edited/blob/master/src/GameServer.js#L1381

**'&sport=' + this.config.serverPort +** => **'&sport=' + this.config.customPort +**

Done. 

Now open **gameserver.ini** and turn on gametrackers. then example in ogar-tracker.tk you will see IP:69 not server port which is IP:443 (:. 
Next time when you want to change port for gametrackers just open gameserver.ini change **customPort = 69** to your port which you are using with nginx.
