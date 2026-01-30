---
title: "how to completely kill pesky ubuntu scrollbars"
date: 2014-10-29
categories: 
  - "osde"
tags: 
  - "scrollbars"
  - "ubuntu"
  - "xubuntu"
---

how to completely kill pesky ubuntu overlay scrollbars

```
# aptitude remove overlay-scrollbar overlay-scrollbar-gtk2 overlay-scrollbar-gtk3
```

or

```
# vi /etc/X11/Xsession.d/81overlay-scrollbar
```

and comment out all the lines

then logout and login
