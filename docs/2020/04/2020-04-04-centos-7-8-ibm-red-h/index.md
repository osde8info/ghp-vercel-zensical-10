---
title: "CentOS 7 &amp; 8 IBM Red Hat 7 &amp; 8 KDE install"
date: 2020-04-04
categories: 
  - "osde"
---

CentOS 7 & IBM Red Hat 7 KDE desktop

```
# yum grouplist

# yum groupinstall KDE
```

CentOS 8 IBM Red Hat 8 KDE desktop

```
# rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
# dnf config-manager --enable PowerTools
# dnf config-manager --enable epel-playground
```

```
# dnf group install "KDE Plasma Workspaces"
# dnf group install kde-desktop
# dnf group install kde-apps
```

See also

- https://fedoraproject.org/wiki/EPEL#How\_can\_I\_use\_these\_extra\_packages.3F
- https://en.secnews.gr/204573/centos-8-kde-plasma-install/

IBM Red Hat 7 & KDE desktop

![VirtualBox_irh78_04_04_2020_14_30_18.png](images/virtualbox_irh78_04_04_2020_14_30_18.png)
