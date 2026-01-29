---
title: "oracle 5u6 and phpmyadmin"
date: 2011-02-14
categories: 
  - "osde"
tags: 
  - "dba"
  - "sysadmin"
  - "webdev"
---

the oracle 5u6 repos seems to missing  php-mcrypt so you can't directly install and run phpmyadmin !

what i had to do was

- add centos 5 yum repo
- rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-5
- add rpmforge yum repo
- yum install php-mcrypt (from centos repo)
- yum install phpmyadmin (from rpmforge repo)

and then

- edit /etc/httpd/conf.d/phpmyadmin.conf to allow my IP
- service httpd reload
