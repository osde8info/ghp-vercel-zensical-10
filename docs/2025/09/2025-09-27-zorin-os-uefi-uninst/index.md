---
title: "zorin os uefi uninstall"
date: 2025-09-27
categories: 
  - "osde"
---

if you are fed up with how slow zorin gnome os is and want to replace it with mx xfce linux then

edit grub (disable hidden mode enable uefi boot)

```
# vi /etc/default/grub
comment out HIDDEN & TIMEOUT rows
# update-grub
# reboot
```

reboot

choose uefi for grub menu

make sure your mx iso/usb has a higher boot priority than the ssd

save & exit

install mx xfce linux from iso/usb
