---
title: "oracle linux 7 &amp; 8 and epel xfce"
date: 2022-12-22
categories: 
  - "osde"
---

first add extra dnf yum rpm epel repos from oracle and fedora

# dnf install

```
dnf install oraclelinux-developer-release-el8 
dnf install oracle-epel-release-el8
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
```

# dnf repolist

```
dnf repolist
repo id                           repo name
epel                              Extra Packages for Enterprise Linux 8 - x86_64
ol8_UEKR7                         Latest Unbreakable Enterprise Kernel Release 7 for Oracle Linux 8 (x86_64)
ol8_appstream                     Oracle Linux 8 Application Stream (x86_64)
ol8_baseos_latest                 Oracle Linux 8 BaseOS Latest (x86_64)
ol8_developer                     Oracle Linux 8 Development Packages (x86_64)
ol8_developer_EPEL                Oracle Linux 8 EPEL Packages for Development (x86_64)
ol8_developer_EPEL_modular        Oracle Linux 8 EPEL Modular Packages for Development (x86_64)

```

# dnf grouplist

```
dnf grouplist
...
Xfce
...
```

# dnf groupinstall

```
dnf groupinstall xfce
```

# switch from gdm to lightdm (to stop gdm & gnome-shell killing CPU)

```
dnf install lightdm
systemctl disable gdm
systemctl enable lightdm
```

# systemctl invoke to graphical ui

(you no longer use runlevel and startx)

```
systemctl get-default 
systemctl invoke graphical.target
```

# systemctl set-default startup mode

```
systemctl get-default 
systemctl set-default graphical.target
```

refs

- [how-to-install-xfce-gui-on-oracle](https://www.how2shout.com/linux/how-to-install-xfce-gui-on-oracle-linux-8-or-7/)
- [systemd-targets](https://documentation.suse.com/smart/linux/single-html/reference-managing-systemd-targets-systemctl/index.html)
- [systemd-startup](https://www.redhat.com/sysadmin/configure-systemd-startup-targets)
- [working-with-systemd-targets](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/working-with-systemd-targets_configuring-basic-system-settings#doc-wrapper)
- [replace-gdm-with-lightdm](https://www.systutorials.com/how-to-replace-gdm-with-lightdm-on-fedora/)

[![](images/virtualbox_orac8b_22_12_2022_15_09_21.png)](https://osde8info.wordpress.com/wp-content/uploads/2022/12/virtualbox_orac8b_22_12_2022_15_09_21.png)
