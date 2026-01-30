---
title: "centos oracle uek red hat enterprise linux rpm repos for extra packages such as php 5.6"
date: 2015-07-23
categories: 
  - "osde"
tags: 
  - "centos"
  - "php"
  - "repo"
  - "rpm"
  - "yum"
---

centos oracle uek red hat enterprise linux 5, 6 & 7 rpm yum repos for extra packages such as php 5.6

http://www.rackspace.com/knowledge\_center/article/install-epel-and-additional-repositories-on-centos-and-red-hat

- EPEL - https://dl.fedoraproject.org/pub/epel/6Server/
- IUSC - https://iuscommunity.org/pages/About.html
- REMI - http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
- Webtatic (not recommended) - https://webtatic.com/packages/php56/

recommended procedure is

install rpm-gpg-key IUS-COMMUNITY-GPG-KEY

```
# wget https://dl.iuscommunity.org/pub/ius/stable/Redhat/6/x86_64/epel-release-6-5.noarch.rpm
# rpm -ivh epel-release-6-5.noarch.rpm
# wget https://dl.iuscommunity.org/pub/ius/stable/Redhat/6/x86_64/ius-release-1.0-14.ius.el6.noarch.rpm
# rpm -ivh ius-release-1.0-14.ius.el6.noarch.rpm

# yum install nginx
# yum install php56u-fpm
```
