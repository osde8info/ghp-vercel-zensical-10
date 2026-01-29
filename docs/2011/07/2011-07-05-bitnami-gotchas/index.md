---
title: "bitnami gotchas"
date: 2011-07-05
categories: 
  - "osde"
tags: 
  - "sysadmin"
---

bitnami gotchas

ssh is disabled so you need to enable ssh by # cd /etc # mv ssh.conf.bak ssh.conf # stop ssh # start ssh

ubuntu repos are disabled so you need to the enable ubuntu repos # apt-get update

aptitude is not installed # apt-get install aptitude

iptables blocks most connections # aptitude remove iptables

mysql only allows local logins update user set host ="%"

http.conf and my.cnf are not in /etc but in /opt/bitnami instead !
