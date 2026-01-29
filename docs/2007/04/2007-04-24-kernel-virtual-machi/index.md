---
title: "kernel virtual machine (kvm) virtualisation"
date: 2007-04-24
categories: 
  - "osde"
tags: 
  - "amd"
  - "gnu-linux"
  - "hvm"
  - "intel"
  - "kvm"
  - "open-source"
  - "svm"
  - "virtual-machine"
  - "virtualisation"
  - "vt"
  - "xen"
---

There is yet another virtualisation technology on the block !

[http://www.vizzr.info/2007/04/24/kernel-virtual-machine-kvm/](http://www.vizzr.info/2007/04/24/kernel-virtual-machine-kvm/)

kvm only run on processors that supports x86 hvm (vt/svm instructions set) whereas Xen also allows running modified operating systems on non-hvm x86 processors using a technique called paravirtualization. kvm does not support paravirtualization for cpu but may support paravirtualization for device drivers to improve I/O performance.  
[kvm FAQ](http://kvm.qumranet.com/kvmwiki/FAQ)  
  
Proprietary vendors take note :  
Xen and kvm make use of Intel-VT and AMD-V hardware virtualisation features !  

[Read and post comments](http://osde-info.vox.com/library/post/kernel-virtual-machine-kvm-virtualisation.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00d4143268903c7f?_c=feed-atom-full)
