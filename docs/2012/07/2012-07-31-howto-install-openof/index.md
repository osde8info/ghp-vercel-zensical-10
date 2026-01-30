---
title: "howto install openoffice on oracle linux 6"
date: 2012-07-31
categories: 
  - "osde"
tags: 
  - "open-office"
  - "oracle-linux"
  - "red-hat"
---

howto install openoffice 3.4 on centos 6, red hat 6 and oracle enterprise linux 6

- download openoffice 3.4 rpm tgz from http://www.openoffice.org/download/
- untar
- cd en-US/RPMS
- yum --nogpgcheck localinstall \*.rpm
- yum --nogpgcheck localinstall desktop-integration/openoffice.org3.4-redhat-menus-3.4-9590.noarch.rpm

enjoy however this will not work for oracle enterprise linux 5 you'll need to use ooo 3.3 instead

- [http://www.openoffice.org/download/contribute.html?download/OOo\_3.3.0](http://www.openoffice.org/download/contribute.html?download=mirrorbrain&files/stable/3.3.0/OOo_3.3.0_Linux_x86_install-rpm-wJRE_en-US.tar.gz)
