---
title: "apache httpd ssl"
date: 2011-03-11
categories: 
  - "osde"
tags: 
  - "netadmin"
  - "security"
  - "sysadmin"
  - "webdev"
---

apache httpd ssl using virtualmin and webmin

- create a [signing request](http://www.virtualmin.com/documentation/tutorial/how-to-add-an-ssl-certificate "virtualmin")
- buy a wildcard certificate ($200 from [www.rapidssl.com](http://www.rapidssl.com/buy-ssl/wildcard-ssl-certificate/index.html))
- [convert](http://www.petefreitag.com/item/16.cfm "petefreitag") .PFX to .PEM
- [convert](http://www.petefreitag.com/item/16.cfm "petefreitag") .PEM to .CRT and .KEY
- [remove passphrase](http://www.petefreitag.com/item/16.cfm "petefreitag") so apache doesn't ask for it on restart
- copy .CRT into /etc/pki/tls/certs
- copy .KEY into /etc/pki/tls/private
- use virtualmin to [install certificate](http://www.virtualmin.com/node/15675 "virtualmin") into virtual server
