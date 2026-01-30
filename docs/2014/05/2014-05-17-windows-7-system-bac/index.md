---
title: "windows 7 system backup &amp; restore"
date: 2014-05-17
categories: 
  - "osde"
tags: 
  - "backup"
  - "recover"
  - "restore"
  - "sysadmin"
  - "windows"
---

to create a windows 7 system backup & restore it you first need to run

- disk cleanup
- disk defrag
- disk shrink

because you can only restore the backup to a BIGGER disk for example if you are only using 30G of a 300G disk you CANNOT restore the backup to a 200G disk but you could to a 500G disk which you might not have

when you have shrunk you disk you can then run

- start | maintenance | create a system repair dvd
- start | maintenance | backup and restore | create a system image dvd set

then

- boot from system repair dvd
- insert system image dvds when required

make sure you only restore to same hardware otherwise you will get the error

- this is an invalid copy of windows
