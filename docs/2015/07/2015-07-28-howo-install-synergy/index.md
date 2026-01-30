---
title: "howo install #synergy-project keyboad and mouse sharing app on #ed/x/ubuntu"
date: 2015-07-28
categories: 
  - "osde"
tags: 
  - "deb"
  - "install"
  - "sysadmin"
  - "ubuntu"
---

howo install synergy-project keyboad and mouse sharing app on ed/x/ubuntu

download deb from http://synergy-project.org/download/free/

aptitude does not let you install local debs and dkpg doesnt fix dependencies so either

```
aptitude install libqtcore4 libqtgui4 libqt4-network
```

before you run dkpg or

```
aptitude install gdebi
```

and use gdebi or gdebi-gtk to install synergy-1.4.18-r2250-Linux-x86\_64.deb
