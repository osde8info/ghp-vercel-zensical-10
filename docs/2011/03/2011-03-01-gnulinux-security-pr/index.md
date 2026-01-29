---
title: "gnu/linux security problems"
date: 2011-03-01
categories: 
  - "osde"
tags: 
  - "gnu-linux"
  - "security"
  - "sysadmin"
  - "ubuntu"
---

i've just noticed that

- [webmin](http://www.webmin.com/ "webmin") | networking | linux firewall reads from the master iptables files and does NOT display any changes made to iptables by other services since system boot such as fail2ban so you need to click REVERT CONFIGURATION to get webmin to display current configuration
- [webmin](http://www.webmin.com/ "webmin") doesn't display [iptables](http://www.netfilter.org/projects/iptables/index.html "netfilter") comments unless you click "Display comment in rules list?" (on distros derived from red hat)
- [webmin](http://www.webmin.com/ "webmin") loses  [iptables](http://www.netfilter.org/projects/iptables/index.html "netfilter") comments unless you click "Store comments as" "--comment option" (on distros derived from red hat)
- [fail2ban](http://www.fail2ban.org/wiki/index.php/Main_Page "fail2ban") (service fail2ban start) adds its ip chain to the begining of your [iptables](http://www.netfilter.org/projects/iptables/index.html "netfilter") rules so your fail2ban chain can end up running BEFORE any REJECT and DENY rules you have configured
