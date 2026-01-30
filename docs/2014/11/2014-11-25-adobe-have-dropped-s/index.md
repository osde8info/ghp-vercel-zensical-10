---
title: "adobe have dropped support for acrobat 10 &amp; 11 on gnu/linux"
date: 2014-11-25
categories: 
  - "osde"
tags: 
  - "acrobat"
  - "acroread"
  - "adobe"
  - "pdf"
  - "ubuntu"
---

adobe have dropped support for acrobat 10 & 11 on gnu/linux and now only support osx and windoz but you can install acrobat 9.5.5 on ubuntu 14 by doing the following

remove evince

```
# aptitude remove evince
```

install adobe acroread

```
# add-apt-repository "deb http://archive.canonical.com/ precise partner"
# aptitude update
# aptitude install acroread
```

thanks to

- http://www.noobslab.com/2012/11/install-adobe-acrobat-reader-in-ubuntu.html
- http://ubuntuhandbook.org/index.php/2014/04/install-adobe-reader-ubuntu-1404/
- http://ubuntuhandbook.org/index.php/2014/10/install-adobe-reader-ubuntu-14-10/
- http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1\_i386linux\_enu.deb
