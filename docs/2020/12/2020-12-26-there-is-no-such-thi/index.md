---
title: "there is no such thing as the perfect gnu/linux #desktop ! but @oraclelinux, @ibm @redhat and @canonical @xubuntu are as close as you can get"
date: 2020-12-26
categories: 
  - "osde"
---

the perfect gnu/linux #desktop just does not exist ! but @oraclelinux, @ibm @redhat and @canonical @xubuntu are as close as you can get

however

oracle linux and ibm red hat linux only run GNOME which uses 4G of RAM which make them unusable on sub £500 hardware and have never been able to run chromium however MS has now fixed this with edge

xubuntu solves the MEMORY problem with XFCE but then pre-installs a lot of AUTOSTART garbage such as SNAP, SPICE & UNATTENDED UPGRADE that use up to 50% CPU for no reason

UU is garbage for THREE reasons

- it uses 50% CPU
- it breaks aptitude
- it doesnt actually install any updates

if you are getting any of these problems or errors

```
# aptitude safe-upgrade
E: Could not get lock /var/lib/dpkg/lock-frontend. 
It is held by process 3349 (unattended-upgr)
E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), is another process using it?
```

then i suggest uninstalling it

```
# aptitude remove unattended-upgrades
```
