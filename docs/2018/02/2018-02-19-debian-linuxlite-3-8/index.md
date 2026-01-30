---
title: "debian linuxlite 3.8 (ubuntu 16.x) intel microcode"
date: 2018-02-19
categories: 
  - "osde"
tags: 
  - "intel"
  - "microcode"
  - "xubuntu"
---

debian linuxlite 3.8 (ubuntu 16.x) intel microcode

- https://askubuntu.com/questions/929274/16-04-how-to-get-the-recommended-intel-microcode-package-to-fix-hyper-threading
- https://launchpad.net/ubuntu/xenial/+package/intel-microcode
- https://launchpad.net/ubuntu/+source/intel-microcode/3.20180108.0~ubuntu16.04.2
- http://ftp.us.debian.org/debian/pool/non-free/i/intel-microcode/

after yoiu have installed this you should see

```
# journalctl | grep microcode

Feb 19 14:57:18 lili kernel: microcode: 
CPU0 sig=0x40651, pf=0x1, revision=0x1d

Feb 19 14:57:18 lili kernel: microcode: 
Microcode Update Driver: v2.01 <tigran@aivazian.fsnet.co.uk>, 
Peter Oruba
```
