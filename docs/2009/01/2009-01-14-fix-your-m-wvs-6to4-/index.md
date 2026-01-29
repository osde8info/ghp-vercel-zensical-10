---
title: "Fix your M$ WVS 6TO4 adapter errors by downgrading !"
date: 2009-01-14
categories: 
  - "osde"
tags: 
  - "6to4"
  - "adapter"
  - "device"
  - "device-driver"
  - "network"
  - "ubuntu"
  - "wi-fi"
  - "wvs"
---

A lot of googled webpages seem to suggest you can fix your WVS 6TO4 yellow exclaimation mark device errors

> 6TO4 Adapter  
> 6.0.6000.16386  
> This device cannot start (Code 10)  

by downgrading to WXP which sounds a bit drastic to me !

[![6to4](images/6a00d4141b9517685e0109d0fe3f13000f.jpg)](http://osde8info.wordpress.com/wp-content/uploads/2009/01/6a00d4141b9517685e0109d0fe3f13000f.jpg "6to4")[![devman](images/6a00d4141b9517685e0109d0fe3f14000f.jpg)](http://osde8info.wordpress.com/wp-content/uploads/2009/01/6a00d4141b9517685e0109d0fe3f14000f.jpg "devman")

However according to [ComputerWorld](http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9040318)  only certain WVS Licences can be downgraded to WXP ! _Owners of the OEM editions of Vista Business and Vista Ultimate can downgrade to XP ... but Vista Home Basic and Vista Home Premium owners can't !_

[M$ TechNet](http://social.technet.microsoft.com/forums/en-US/itprovistahardware/thread/3c7de6f8-afb7-4d90-8d1f-5e170520432e/) has a few less drastic options:

1. Uninstall 6TO4 & reinstall 6TO4  
    
2. Use NETSH INTERFACE 6TO4 SET STATE DISABLE to disable 6TO4
3. Just ignore it ! _You can completely ignore this error, if there isn’t IPv6 network deployed in the environment. The error won’t affect your system.  
    _

  
Finally the best bet may be to 'UPGRADE' to [Ubuntu](http://www.ubuntu.com/) but then your Wi-Fi might stop working instead like mine did !

You just can't win ! Or maybe its time to switch to Sun [OpenSolaris](http://opensolaris.org/os/) ?  

[Read and post comments](http://osde-info.vox.com/library/post/fix-your-m-wvs-6to4-adapter-errors-by-downgrading.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e010980c97e2e000b?_c=feed-atom-full)
