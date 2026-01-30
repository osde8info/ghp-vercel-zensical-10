---
title: "#oracle #gnu/#linux 6 #firefox #browser 22 #yum repo"
date: 2013-06-26
categories: 
  - "osde"
tags: 
  - "firefox"
  - "gnu-linux"
  - "oracle"
  - "repo"
  - "yum"
---

oracle gnu/linux 6 can use firefox browser 22 from the remi yum repo

```
# wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm# yum localinstall remi-release-6.rpm# vi /etc/yum.repos.d/remi.reposet enabled = 1# yum update firefox
```
