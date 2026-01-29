---
title: "DELL Open Manage and older systems"
date: 2011-01-11
categories: 
  - "osde"
tags: 
  - "dell"
  - "openmanage"
  - "perc"
  - "raid"
  - "sysadmin"
---

Before you get carried away installing the latest (6.4) version of DELL Open Manage Server Administrator on an older system its worth checking the [OMSA docs](http://support.dell.com/support/edocs/software/svradmin/ "DELL OMSA") and [OMSA RAID compatibility list](http://support.dell.com/support/edocs/software/svradmin/6.4/en/COMPAT/HTML/8prcmtrx.htm "DELL OMSA RAID") so you dont actually lose any functionality !

For example the highest version of OM that works with

- a DELL PE 1800 with PERC 4/SC raid controller or
- a DELL PE 2900 with PERC 6/i raid controller

is OM 6.1 with SMS 3.1

So instead of installing the latest OM you'll need to chose the best version for your hardware from

[http://linux.dell.com/repo/hardware/](http://linux.dell.com/repo/hardware/)
