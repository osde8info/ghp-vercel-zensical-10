---
title: "HOWTO : Install Firefox 2 with flash and java plugins on Ubuntu 6.06"
date: 2007-09-03
categories: 
  - "osde"
tags: 
  - "6-06"
  - "addon"
  - "firefox"
  - "flash"
  - "howto"
  - "install"
  - "java"
  - "plugin"
  - "ubuntu"
  - "xubuntu"
---

DOWNLOAD  
firefox-2.0.0.6.tar.gz  
install\_flash\_player\_9\_linux.tar.gz  
jre-6u2-linux-i586.bin

INSTALL FIREFOX  
\# cd /opt  
\# tar zxvf ~/firefox-2.0.0.6.tar.gz

INSTALL FLASH PLUGIN  
\# cd /  
\# tar zxvf ~/install\_flash\_player\_9\_linux.tar.gz  
\# cd install\_flash\_player\_9\_linux  
\# ./flashplayer-installer

INSTALL SUN JAVA  
\# cd /opt  
\# cp ~/jre-6u2-linux-i586.bin .  
\# chmod u+x jre-6u2-linux-i586.bin  
\# ./jre-6u2-linux-i586.bin

INSTALL SUN JAVA PLUGIN  
\# cd /opt/firefox/plugins/  
\# ln -s /opt/jre1.6.0\_02/plugin/i386/ns7/libjavaplugin\_oji.so .

VERIFY INSTALLATION  
Run Firefox 2 and goto "about:plugins"

Default Plugin  
    File name: libnullplugin.so

MIME Type     Description     Suffixes     Enabled  
\*     All types     .\*     No

  
Shockwave Flash  
    File name: libflashplayer.so  
    Shockwave Flash 9.0 r48

MIME Type     Description     Suffixes     Enabled  
application/x-shockwave-flash     Shockwave Flash     swf     Yes  
application/futuresplash     FutureSplash Player     spl     Yes

  
Java(TM) Plug-in 1.6.0\_02-b05  
    File name: libjavaplugin\_oji.so  
    Java(TM) Plug-in 1.6.0\_02

MIME Type     Description     Suffixes     Enabled  
application/x-java-vm     Java         Yes  
application/x-java-applet     Java         Yes  

[Read and post comments](http://osde-info.vox.com/library/post/howto-install-firefox-2-with-flash-and-java-plugins-on-ubuntu-606.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00e398a46d6a0005?_c=feed-atom-full)
