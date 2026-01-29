---
title: "MEMSET virtual web hosting"
date: 2007-08-21
categories: 
  - "osde"
tags: 
  - "centos"
  - "cpanel"
  - "memset"
  - "plesk"
  - "reseller"
  - "root"
  - "server"
  - "ssh"
  - "sysadmin"
  - "virtual-machine"
  - "vm"
  - "vps"
  - "webdev"
  - "webhost"
  - "wget"
---

I'm now trying [MEMSET](http://www.memset.com/index.php) virtual web hosting and its looking very good so far.

WHM/CPANEL has changed (improved) a lot since I last used it two years ago (when I defected to Plesk).

Not only does the [MEMSET](http://www.memset.com/index.php) reseller package give you ssh root access to your VM you also get ability to update Fantastico yourself and update key system packages such as wget !

If fact the very first thing you have do using WHM (and by ssh as root) is update wget

```
# rpm -qa wget ;# wget ftp://fr2.rpmfind.net/linux/fedora/core/5/i386/os/Fedora/RPMS/wget-1.10.2-3.2.1.i386.rpm ;# rpm -e wget ;# rpm -ivh --force wget-1.10.2-3.2.1.i386.rpm ;# rpm -qa wget ;
```

[https://netenberg.com/forum/index.php?topic=5430.0](https://netenberg.com/forum/index.php?topic=5430.0)

and then update Fantastico !

Not for VM webhost beginners then but power equals complexity !  

[Read and post comments](http://osde-info.vox.com/library/post/memset-virtual-web-hosting.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00e3989fe1390004?_c=feed-atom-full)
