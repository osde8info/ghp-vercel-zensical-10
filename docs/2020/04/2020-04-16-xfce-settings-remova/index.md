---
title: "XFCE | settings | removable media | auto mount without opening file browser"
date: 2020-04-16
categories: 
  - "osde"
tags: 
  - "automount"
  - "file-manager"
  - "media"
  - "xfce"
---

In XFCE | goto settings | click removable media | uncheck browse

XFCE will now auto mount media without opening file browser (a real help if you are re flashing balena.io raspberry pi resin os images that have 5 partitions)

XFCE by default pops up a very irritating thunar file manager window for EVERY mount

![automount.png](images/automount.png)

balina.io raspberry pi resin OS SD card now mounts 5 partitions without 5 popups

```
/dev/sdb1 on /media/cdarra/resin-boot type vfat (rw,nosuid,nodev,relatime,uid=1000,gid=1000,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,showexec,utf8,flush,errors=remount-ro,uhelper=udisks2)
/dev/sdb2 on /media/cdarra/resin-rootA type ext4 (rw,nosuid,nodev,relatime,uhelper=udisks2)
/dev/sdb3 on /media/cdarra/resin-rootB type ext4 (rw,nosuid,nodev,relatime,uhelper=udisks2)
/dev/sdb5 on /media/cdarra/resin-state type ext4 (rw,nosuid,nodev,relatime,uhelper=udisks2)
/dev/sdb6 on /media/cdarra/resin-data type ext4 (rw,nosuid,nodev,relatime,uhelper=udisks2)
```
