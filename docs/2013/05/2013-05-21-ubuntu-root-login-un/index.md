---
title: "ubuntu root login unblocking"
date: 2013-05-21
categories: 
  - "osde"
tags: 
  - "gui"
  - "kde"
  - "login"
  - "root"
  - "ubuntu"
---

in ed/k/x/ubuntu there is no root password by default so you'll first need to set a root password with

```
$ sudo -i
# passwd
```

on xubuntu you can now login to the gui as root but on kubuntu you still can't since KDE is preventing root logins so you'll also need to edit

```
/etc/kde4/kdm/kdmrc
```

and comment out the line with a #

```
# AllowRootLogin=false
```

see also

- https://answers.launchpad.net/ubuntu/+source/sudo/+question/160469
- http://www.kubuntuforums.net/showthread.php?58495-I-need-to-enable-ROOT-login
