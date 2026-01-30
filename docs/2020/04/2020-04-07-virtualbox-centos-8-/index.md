---
title: "VirtualBox CentOS 8 guest additions install"
date: 2020-04-07
categories: 
  - "osde"
tags: 
  - "centos"
  - "virtualbox"
---

To get VirtualBox guest additions to install in CentOS 8 you first need to install

```
# dnf install epel-release
# dnf install tar bzip2 kernel-devel-$(uname -r) \
kernel-headers perl gcc make elfutils-libelf-devel
```

then insert the guest additions cd and if not running X manually mount it

```
# mkdir /media/iso
# mount /dev/cdrom /media/iso
```

then run

```
# cd /media/iso
# ./VBoxLinuxAdditions.run
```

see

- https://linuxconfig.org/virtualbox-install-guest-additions-on-redhat-8
