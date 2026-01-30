---
title: "grub grub2 howto boot into singleuser mode"
date: 2022-02-09
categories: 
  - "osde"
---

grub grub2 howto boot into singleuser mode

hold SHIFT while powering up

press E

find line containing linux and ro

append "single"

F10

`$ passwd`

to reset root password

`$ reboot`

refs

- https://www.gnu.org/software/grub/manual/grub/
- https://help.ubuntu.com/community/Grub2/Setup
- https://askubuntu.com/questions/132965/how-do-i-boot-into-single-user-mode-from-grub
- https://www.osradar.com/access-single-user-mode-ubuntu-20-04/
- https://www.compuhoy.com/how-do-i-start-ubuntu-in-single-user-mode/
- https://devconnected.com/single-user-mode-secure-boot-on-ubuntu-debian/
- https://linoxide.com/boot-linux-grub-single-user-mode/
