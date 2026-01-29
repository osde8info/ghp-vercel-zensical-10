---
title: "BYTEMARK UML VM shell command output"
date: 2007-08-20
categories: 
  - "osde"
tags: 
  - "debian"
  - "df"
  - "gnu-linux"
  - "pstree"
  - "shell"
  - "sysadmin"
  - "uml"
  - "uname"
  - "virtual-machine"
  - "vizzr-info"
---

UNAME  
$ uname -a  
Linux <myvm>.vm.bytemark.co.uk 2.6.20.3-bytemark-uml-2 #3 Mon Apr 30 13:12:13 BST 2007 i686 GNU/Linux

DF (mine all mine!)`    $ df -h   Filesystem            Size  Used Avail Use% Mounted on   /dev/ubdc             9.9G  447M  9.1G   5% /   tmpfs                  72M     0   72M   0% /lib/init/rw   udev                   10M   16K   10M   1% /dev   tmpfs                  72M  4.0K   72M   1% /dev/shm    `  
PSTREE``    $ pstree   init-+-apache2---6*[apache2]        |-cron        |-events/0        |-2*[getty]        |-khelper        |-klogd        |-ksoftirqd/0        |-kthread-+-aio/0        |         |-kblockd/0        |         |-kcryptd/0        |         |-kjournald        |         |-kswapd0        |         |-2*[pdflush]        |         |-xfsdatad/0        |         `-xfslogd/0        |-mdadm        |-mysqld_safe-+-logger        |             `-mysqld---mysqld---10*[mysqld]        |-ntpd        |-sshd---sshd---bash---pstree        |-syslogd        `-udevd    ``

[Read and post comments](http://osde-info.vox.com/library/post/bytemark-xen-vm-shell-command-output.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00e3989f8c760004?_c=feed-atom-full)
