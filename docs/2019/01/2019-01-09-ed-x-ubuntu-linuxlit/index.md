---
title: "ed/x/ubuntu &amp; #linuxlite gnu/linux @canonical #grub safe upgrade bug"
date: 2019-01-09
categories: 
  - "osde"
tags: 
  - "bug"
  - "grub"
  - "ubuntu"
---

ed/x/ubuntu grub aptitude safe upgrade bug !

what should the AVERAGE punter do ???

- install package maintainers version
- keep local version
- do a 3-way merge

or just

- TOSS A COIN

```
--- /etc/default/grub root.root 0644 2019-01-08 04:12:59
+++ /tmp/grub.0yzbxKI6ig root.root 0644 2019-01-09 23:25:42
@@ -3,21 +3,13 @@
# For full documentation of the options in this file, see:
# info -f grub -n 'Simple configuration'

-GRUB_DEFAULT=saved
-#GRUB_DEFAULT=0
-GRUB_SAVEDEFAULT=true
-GRUB_HIDDEN_TIMEOUT=0
-GRUB_HIDDEN_TIMEOUT_QUIET=true
+GRUB_DEFAULT=0
+GRUB_TIMEOUT_STYLE=hidden
GRUB_TIMEOUT=10
-GRUB_DISTRIBUTOR='Linux Lite'
-#GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
-#GRUB_DISTRIBUTOR=`lsb_release -d 2> /dev/null || echo Debian`
+GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX=""

-# Linux Lite Grub background
-GRUB_BACKGROUND="/boot/grub_linux_lite.png"
-
# Uncomment to enable BadRAM filtering, modify to suit your needs
# This works with Linux (no patch required) and with any kernel that obtains
# the memory map information from GRUB (GNU Mach, kernel of FreeBSD ...)
@@ -30,8 +22,6 @@
# note that you can use only modes which your graphic card supports via VBE
# you can see them in real GRUB with the command `vbeinfo'
#GRUB_GFXMODE=640x480
-GRUB_GFXPAYLOAD_LINUX="keep"
-GRUB_VIDEO_BACKEND="vbe"

# Uncomment if you don't want GRUB to pass "root=UUID=xxx" parameter to Linux
#GRUB_DISABLE_LINUX_UUID=true
```
