---
title: "linuxlite ubuntu unattended upgrades"
date: 2018-02-20
categories: 
  - "osde"
tags: 
  - "linuxlite"
  - "systemd"
  - "updates"
  - "upgrades"
---

linuxlite and ubuntu gnu/linux installs may have automatic unattended upgrades installed and enabled

to check the status of your system

```
$ aptitude show unattended-upgrades
```

if installed you can disable it by editing /etc/apt/apt.conf.d/50unattended-upgrades or remove the unattended-upgrades package

```
# aptitude remove unattended-upgrades
# rm /etc/apt/apt.conf.d/50unattended-upgrades
# reboot
```

 

https://github.com/chef/bento/issues/609

_In past versions of Ubuntu, unattended package upgrades were handled by creating a cron job in /etc/cron.daily responsible for running apt. With 16.04 and the shift to systemd, unattended upgrades are handled by a systemd unit. The new systemd unit has OnCalendar set to 6am and 6pm, along with Persistent set to true. The result is that a full apt-get update && apt-get ugrade will run the first time the box boots, in order to "catch-up" with missed runs._

see also

- http://ask.xmodulo.com/disable-automatic-updates-ubuntu.html
- https://askubuntu.com/questions/953779/programmatically-disable-apt-unattended-upgrades
- https://linoxide.com/ubuntu-how-to/enable-disable-unattended-upgrades-ubuntu-16-04/
