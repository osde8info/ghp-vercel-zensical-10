---
title: "windows 10 windows store app uninstall"
date: 2018-02-08
categories: 
  - "osde"
tags: 
  - "app"
  - "store"
  - "uninstall"
  - "windoz"
---

windows 10 windows store app uninstall

- http://www.thewindowsclub.com/erase-default-preinstalled-modern-apps-windows-8
- https://www.howtogeek.com/224798/how-to-uninstall-windows-10s-built-in-apps-and-how-to-reinstall-them/

_When you uninstall a Windows Store App using the usual options, the app is removed temporarily and goes to a staged condition discussed later in this article. Thus, when you create a new user account on Windows 8/10, it will again have all the pre-installed apps, since the default Windows Store Apps are not removed completely from the system._

_To completely remove and erase all default pre-installed apps, you must be signed in as Administrator of you Windows Account – and you need to remove it in two places:_

- _Remove the provisioned package_
- _Remove the “installed” package from the administrator account._

eg

```
PS C:\Windows\system32> Get-AppxPackage *zune* | Remove-AppxPackage
```
