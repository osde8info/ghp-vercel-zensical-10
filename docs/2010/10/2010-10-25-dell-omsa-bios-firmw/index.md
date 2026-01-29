---
title: "DELL OMSA BIOS &amp; firmware installer"
date: 2010-10-25
categories: 
  - "osde"
tags: 
  - "sysadmin"
---

[http://linux.dell.com/repo/hardware/OMSA\_6.2/](http://linux.dell.com/repo/hardware/OMSA_6.2/)

DELL OMSA 6.2 can now be used to install BIOS & firmware updates on DELL PowerEdge servers running CentOS, OracL or RHEL 5. With OMSA 6.2 you'll get the extra commands

- bootstrap\_firmware --inventory
- inventory\_firmware
- update\_firware

However if your PowerEdge has any LSI Logic / Symbios Logic MegaRAID SAS 1078 (rev 04)  disk controllers do not be tempted to try OMSA 6.4 or you will lose all RAID SAS mgmt access ! Solution downgrade back to OMSA 6.2.

Server Administrator: Storage Service EventID: 2131 The current firmware version  6.0.2-0002 is older than the required firmware version 6.2.0-0012 for a controller of model 0x1F0C:  Controller 0 (PERC 6/i Integrated)
