---
title: "windows 7 fast user switching"
date: 2013-05-06
categories: 
  - "osde"
tags: 
  - "switch"
  - "switching"
  - "user"
  - "windoz"
---

windows 7 how to disable switch user button or fast user switching

windows 7 home premium

- run regedit
- goto HKEY\_LOCAL\_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System
- add new dword HideFastUserSwitching
- set it to 1

windows 7 professional

- run gpedit
- goto admin templates | system | logon
- click on hide entry points for fast user switching
- set it to 1

references

- [http://www.bleepingcomputer.com/tutorials/disable-fast-user-switching-in-windows/](http://www.bleepingcomputer.com/tutorials/disable-fast-user-switching-in-windows/)  
    
- [http://social.technet.microsoft.com/Forums/en-US/w7itprogeneral/thread/e153a498-2887-49c4-8a08-7a2d62ee7b39](http://social.technet.microsoft.com/Forums/en-US/w7itprogeneral/thread/e153a498-2887-49c4-8a08-7a2d62ee7b39)
- [http://www.addictivetips.com/windows-tips/how-to-enable-disable-fast-user-switching-in-windows-xp-and-windows-vista/](http://www.addictivetips.com/windows-tips/how-to-enable-disable-fast-user-switching-in-windows-xp-and-windows-vista/)
