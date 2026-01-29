---
title: "WebMin 1.520 tempdelete bug"
date: 2010-10-27
categories: 
  - "osde"
tags: 
  - "sysadmin"
---

WebMin 1.520 sometimes creates a cron job for "/etc/webmin/cron/tempdelete.pl" that will keep sending you error emails saying "Failed to run /usr/libexec/webmin/cron/tempdelete.pl"

Apparently its safe just to delete this webmin cronjob via WebMin | System | Scheduled Cron Jobs

- [http://www.virtualmin.com/node/15523](http://www.virtualmin.com/node/15523)
- [http://www.virtualmin.com/node/15526](http://www.virtualmin.com/node/15526)
