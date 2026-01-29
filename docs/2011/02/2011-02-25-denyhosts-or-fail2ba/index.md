---
title: "denyhosts or fail2ban ?"
date: 2011-02-25
categories: 
  - "osde"
tags: 
  - "security"
  - "sysadmin"
---

should i use [denyhosts](http://denyhosts.sourceforge.net/ "denyhosts") or [fail2ban](http://www.fail2ban.org/wiki/index.php/Main_Page "fail2ban") to protect my servers ?

apparently denyhosts uses tcp wrappers and only protects ssh whereas fail2ban uses iptables and can check more ports but looking at ohloh both seem to be unchanged for 2+ years old and they both only have 12 users !

- [www.ohloh.net/p/denyhosts](https://www.ohloh.net/p/denyhosts)
- [www.ohloh.net/p/fail2ban](https://www.ohloh.net/p/fail2ban)
- [http://www.linuxquestions.org/denyhosts-vs-fail2ban-aka-tcp\_wrappers-vs-iptables-3036/](http://www.linuxquestions.org/questions/blog/unspawn-2450/denyhosts-vs-fail2ban-aka-tcp_wrappers-vs-iptables-3036/)

fail2ban

- [http://www.fail2ban.org/wiki/index.php/MANUAL\_0\_8](http://www.fail2ban.org/wiki/index.php/MANUAL_0_8)
- [http://www.fail2ban.org/wiki/index.php/FAQ\_english](http://www.fail2ban.org/wiki/index.php/FAQ_english)
