---
title: "red hat gnu/linux distros &amp; the xfce desktop environment"
date: 2019-05-08
categories: 
  - "osde"
tags: 
  - "centos"
  - "desktop"
  - "oracle-linux"
  - "red-hat"
  - "xfce"
---

red hat gnu/linux distros & the xfce desktop environment

according to red hat you can only install from http://www.xfce.org/download

- https://access.redhat.com/solutions/56723

but if you add the fedoraproject EPEL repo you can install xfce desktop onto oracle linux 7 (and red hat ?)

```
# wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# yum install epel-release-latest-7.noarch.rpm
# yum groupinstall xfce
```

then logout click options and choose xfce session instead of gnome and login

```
# yum repolist
Loaded plugins: langpacks, ulninfo
repo id                    repo name                                                                         status
epel/x86_64                Extra Packages for Enterprise Linux 7 - x86_64                                    13,174
ol7_UEKR5/x86_64           Latest Unbreakable Enterprise Kernel Release 5 for Oracle Linux 7Server (x86_64)     125
ol7_developer_EPEL/x86_64  Oracle Linux 7Server Development Packages (x86_64)                                26,135
ol7_latest/x86_64          Oracle Linux 7Server Latest (x86_64)                                              12,818
repolist: 52,252
```

- https://www.cyberciti.biz/faq/installing-rhel-epel-repo-on-centos-redhat-7-x/
- https://support.rackspace.com/how-to/install-epel-and-additional-repositories-on-centos-and-red-hat/

BTW if you are using centos you can simply use rpm / yum

```
# yum install epel-release
# yum groupinstall "X Window system"
# yum groupinstall "Xfce"
```

see

- https://www.tuxfixer.com/install-xfce-4-desktop-environment-on-centos-7/
- https://www.rootusers.com/how-to-install-xfce-gui-in-centos-7-linux/
