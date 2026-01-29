---
title: "LogMeIn Hamachi VPN"
date: 2011-09-14
categories: 
  - "osde"
tags: 
  - "beta"
  - "gnu-linux"
  - "netadmin"
  - "sysadmin"
---

A [beta of LogMeIn Hamachi](https://secure.logmein.com/UK/labs/ "logmein beta") VPN is now available for Linux and _offers connectivity from dispersed environments to your resources._

[https://secure.logmein.com/welcome/visualization/fullscreen/](https://secure.logmein.com/welcome/visualization/fullscreen/)

[![LogMeIn network visualisation](images/6146162275_01a79e662e_m.jpg)](http://www.flickr.com/photos/osde-info/6146162275/ "LogMeIn network visualisation by osde8info, on Flickr")

after installing the hamachi rpm `# service logmein-hamachi start # hamachi login # hamachi attach "your-logmein-email-addr" # hamachi` the final hamachi command will list your settings

if you want it to autostart on reboot you'll need to `# chkconfig logmein-hamachi on`

full documentation is available in /opt/logmein-hamachi/README `# hamachi -h LogMeIn Hamachi, a zero-config virtual private networking utility, ver 2.1.0.17`
