---
title: "MEMSET XEN ?"
date: 2007-08-21
categories: 
  - "osde"
tags: 
  - "centos"
  - "gnu-linux"
  - "memset"
  - "open-source"
  - "virtualisation"
  - "vm"
  - "vps"
  - "webhost"
  - "xen"
---

I've just rebooted (# reboot) my [MEMSET](http://www.memset.com/index.php) server logged back in and entered

\# uname -a

Linux localhost 2.6.16-u6-p4-pae #1 SMP Fri Dec 15 17:14:15 GMT 2006 i686 i686 i386 GNU/Linux

and

\# dmesg

...  
VFS: Mounted root (ext3 filesystem) readonly.  
Freeing unused kernel memory: 188k freed

  \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*  
  \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*  
  \*\* WARNING: Currently emulating unsupported memory accesses  \*\*  
  \*\*          in /lib/tls glibc libraries. The emulation is    \*\*  
  \*\*          slow. To ensure full performance you should      \*\*  
  \*\*          install a 'xen-friendly' (nosegneg) version of   \*\*  
  \*\*          the library, or disable tls support by executing \*\*  
  \*\*          the following as root:                           \*\*  
  \*\*          mv /lib/tls /lib/tls.disabled                    \*\*  
  \*\* Offending process: init (pid=1)                           \*\*  
  \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*  
  \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

Continuing...

EXT3 FS on sda1, internal journal  
Adding 131064k swap on /dev/sda2.  Priority:-1 extents:1 across:131064k  
kjournald starting.  Commit interval 5 seconds  
EXT3 FS on loop0, internal journal  
EXT3-fs: mounted filesystem with ordered data mode.  
eth0: no IPv6 routers present  
...

Does this reference to 'xen-friendly' actually mean that I have finally found a true XEN VPS VM webhost provider ?

[Read and post comments](http://osde-info.vox.com/library/post/memset-xen.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00e3989fed9b0002?_c=feed-atom-full)
