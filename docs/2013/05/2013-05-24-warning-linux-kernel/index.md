---
title: "WARNING #linux #kernel 3.2.0-43 breaks #ubuntu @virtualbox 4.2.12 guest vms"
date: 2013-05-24
categories: 
  - "osde"
tags: 
  - "bug"
  - "guest"
  - "ubuntu"
  - "virtualbox"
  - "vm"
---

if you are running @virtualbox 4.2.12 and have an ed/k/x/ubuntu 12.04.02 LTS guest with virtualbox guest additions installed do not allow the the kernel to be updated to 3.2.0-43

- it may hang during boot
- it may give you a black screen
- it may give you a low res video warning

other possible workarounds

- downgrade virtual box to 4.2.10
- do not install virtual box guest additions
- use guest additions from ubuntu repo instead of virtual box iso

also see

- [virtualbox.org/ticket/11709](https://www.virtualbox.org/ticket/11709)
- [gmane.org/gmane.linux.ubuntu.user/267588](http://comments.gmane.org/gmane.linux.ubuntu.user/267588)
- [liam-on-linux.livejournal.com/33987.html](http://liam-on-linux.livejournal.com/33987.html)
- [oracle-base.com/blog/2013/03/29/why-is-my-virtualbox-vm-not-starting-properly/](http://www.oracle-base.com/blog/2013/03/29/why-is-my-virtualbox-vm-not-starting-properly/)
- [forums.virtualbox.org/viewtopic.php?f=1&t=55091&start=30#p254681](https://forums.virtualbox.org/viewtopic.php?f=1&t=55091&start=30#p254681)
- [forums.virtualbox.org/viewtopic.php?f=3&t=55146](https://forums.virtualbox.org/viewtopic.php?f=3&t=55146)
- [forums.virtualbox.org/viewtopic.php?f=3&t=51727&start=15](https://forums.virtualbox.org/viewtopic.php?f=3&t=51727&start=15)
- [forums.virtualbox.org/viewtopic.php?f=3&t=51727#p238979](https://forums.virtualbox.org/viewtopic.php?f=3&t=51727#p238979)
