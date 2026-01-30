---
title: "GRUB 1.99 &amp; GRUB 2.00"
date: 2013-04-30
categories: 
  - "osde"
tags: 
  - "boot"
  - "grub"
  - "ubuntu"
---

GRUB has changed ! so if you want to choose your kernel you have to edit /etc/default/grub and comment out as follows

```
#GRUB_HIDDEN_TIMEOUT=0
#GRUB_HIDDEN_TIMEOUT_QUIET=true
```

then run

```
# update-grub
```

see also

- [https://help.ubuntu.com/community/Grub2](https://help.ubuntu.com/community/Grub2)
- [https://help.ubuntu.com/community/Grub2/Setup#Configuring\_GRUB\_2](https://help.ubuntu.com/community/Grub2/Setup#Configuring_GRUB_2)
