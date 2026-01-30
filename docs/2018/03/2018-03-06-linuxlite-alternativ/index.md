---
title: "linuxlite alternative browser iridium"
date: 2018-03-06
categories: 
  - "osde"
tags: 
  - "browser"
  - "chrome"
---

linuxlite and xubuntu alternative browser iridium

```
wget -qO - https://downloads.iridiumbrowser.de/ubuntu/iridium-release-sign-01.pub | apt-key add -
vi /etc/apt/sources.list.d/iridium-browser.list

deb [arch=amd64] https://downloads.iridiumbrowser.de/deb/ stable main
#deb-src https://downloads.iridiumbrowser.de/deb/ stable main

aptitude update
aptitude install iridium-browser
```
