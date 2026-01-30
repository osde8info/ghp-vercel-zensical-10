---
title: "the gnu/linux client for @hubic (#free 25G/30G of #cloud storage from @ovh https://goo.gl/mYI02E) requires #mono"
date: 2015-09-07
categories: 
  - "osde"
tags: 
  - "client"
  - "cloud"
  - "hubic"
  - "install"
  - "ovh"
---

the gnu/linux client for #hubic (free 25G/30G of cloud storage from @ovh https://goo.gl/mYI02E) requires #mono and other debian packages

so to successfully install in on debian ed/x/ubuntu you will need to

- install gdebi-gtk
- download hubic.deb
- run gdebi-gtk
- open hubic.deb
- click install and gdebi-gtk will install mono and other dependancies for you

links

- https://forums.hubic.com/showthread.php?272-hubiC-for-Linux-beta-is-out-!
- http://mir7.ovh.net/ovh-applications/hubic/hubiC-Linux/2.1.0/

you may still get some lintian errors but may be able to ignore them

```
warning: the authors of lintian do not recommend running it with root privileges!

W: hubic: syntax-error-in-debian-changelog line 29 "badly formatted trailer line"
W: hubic: syntax-error-in-debian-changelog line 31 "found start of entry where expected more change data or trailer"
E: hubic: debian-changelog-file-contains-invalid-email-address julien@Mint-15-MATE
E: hubic: debian-changelog-file-contains-invalid-email-address julien@Mint-15-MATE

Lintian finished with exit status 1
```
