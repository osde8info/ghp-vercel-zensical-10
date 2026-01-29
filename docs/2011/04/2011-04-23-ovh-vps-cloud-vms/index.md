---
title: "ovh vps cloud vms"
date: 2011-04-23
categories: 
  - "osde"
tags: 
  - "floss"
  - "gnu-linux"
  - "lamp"
  - "mysql"
  - "open-source"
  - "ovh"
  - "sysadmin"
  - "virtual-machine"
  - "virtualisation"
  - "webdev"
---

Just in the process of moving all my web hosting to [OVH VPS cloud VMs](http://www.ovh.co.uk/vps/dynamic_vps_technical_sheet.xml "ovh vps") and thought it'd be useful to document how to turn a vanilla [OVH VPS](http://www.ovh.co.uk/vps/ "ovh vps") into a personal multi-site webhost !

- use OVH control panel to replace debian with centos
- add a user
- disable root ssh login
- restart sshd
- disable/uninstall unnessesary services such as smartmontools yum-updatesd
- yum check-update
- run system-config-security
- yum install redhat-lsb
- rpm install rpmforge-release
- yum install fail2ban
- replace sendmail with postfix (unless you like sendmail)
- install LAMP (inc httpd,mod\_ssl and PHP 5.3.3)
- secure mysql (change root pwd and delete guest accounts & dbs)
- chkconfig httpd and mysqld on
- yum install perl-Crypt-SSLeay perl-Net-SSLeay
- yum install webalizer
- install webmin
- secure webmin (change user & port)
- install virtualmin
- enable https
- disable virtualhost mail handling (unless your not using goog apps)
- install rrdtools
- install webmin systemstats
- create virtual hosts
- scp public\_html tgz and mysql sql dumps from old webhost
- untar tgz and mysql < sql
- change DNS ip addresses from old webhost to new webhost
- wait 1 min !
- check new site is running !
