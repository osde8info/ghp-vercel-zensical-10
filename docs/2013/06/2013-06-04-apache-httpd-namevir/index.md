---
title: "#apache #httpd namevirtualhost, virtualhost and servername"
date: 2013-06-04
categories: 
  - "osde"
tags: 
  - "apache"
  - "conf"
  - "config"
  - "httpd"
  - "namevirtualhost"
  - "servername"
  - "sysadmin"
  - "virtualhost"
---

in #apache #httpd to setup virtual hosts use tyhe directives namevirtualhost, virtualhost and servername

```
NameVirtualHost *:80

<VirtualHost *:80>
 ServerName site1.example.com
 DocumentRoot /var/www/site1/public_html
 <Directory "/var/www/site1/public_html">
  allow from all
  Options +Indexes
 </Directory>
</VirtualHost>

<VirtualHost *:80>
 ServerName site2.example.com
 DocumentRoot "/var/www/site2/public_html"
 <Directory "/var/www/site2/public_html">
  allow from all
  Options +Indexes
 </Directory>
</VirtualHost>

<VirtualHost *:80>
 ServerName site3.example.com
 DocumentRoot /var/www/site3/public_html
 <Directory "/var/www/site3/public_html">
  allow from all
  Options +Indexes
 </Directory>
</VirtualHost>
```

to get a list of your vhosts type

```
httpd -S
```

see also

- http://httpd.apache.org/docs/current/vhosts/name-based.html
- https://httpd.apache.org/docs/2.2/vhosts/
- https://httpd.apache.org/docs/2.2/mod/core.html#namevirtualhost
