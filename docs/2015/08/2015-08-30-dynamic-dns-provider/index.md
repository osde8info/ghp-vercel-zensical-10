---
title: "dynamic dns providers for webcams"
date: 2015-08-30
categories: 
  - "osde"
tags: 
  - "dns"
  - "dynamic"
---

if your ipcam web cam doesnt have a builtin dynamic dns you may be able to use one of these providers

- https://www.dnsdynamic.org/
- http://dyn.com/ $/m
- https://www.noip.com/

if you are lucky you wont need to install a client on a pc on your home network and you might able to update via a openwrt style url such as

- http://\[USERNAME\]:\[PASSWORD\]@www.dnsdynamic.org/api/?hostname=\[DOMAIN\]&myip=\[IP\]

see also

- http://sourceforge.net/p/ddclient/wiki/Home/
