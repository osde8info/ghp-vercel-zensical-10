---
title: "windows 7, windows 8 and windows 10 how to disable hibernation"
date: 2013-04-24
categories: 
  - "osde"
tags: 
  - "hibernate"
  - "hibernation"
  - "sysadmin"
  - "windows"
  - "windoz"
---

in windows 7, windows 8 and windows 10 you can no longer disable windows hibernation via the gui (which will delete hiberfil.sys and save you up to 12G of disk space)

you now have to find the command prompt app and right click "run as administrator" or find the powershell app and right click "run as administrator"

then type

```
powercfg -h off

or

powercfg.exe /hibernate off
```

see

- http://www.techrepublic.com/blog/itdojo/delete-hiberfilsys-by-disabling-windows-hibernate-function/1493
- http://support.microsoft.com/kb/920730
