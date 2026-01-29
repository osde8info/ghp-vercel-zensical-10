---
title: "VMware W2K3 Guest Network Cards"
date: 2011-01-13
categories: 
  - "osde"
tags: 
  - "sysadmin"
  - "virtual-machine"
  - "vmware"
---

When creating a VMware Windoz 2003 Server guest its probably a good idea to switch all its virtual network cards from VMXNET to E1000 as soon as possible and certainly before installing any Service Packs !

- [http://pubs.vmware.com/guestnotes/guestos\_win2003.html](http://pubs.vmware.com/guestnotes/wwhelp/wwhimpl/common/html/wwhelp.htm?context=Favorites&file=guestos_win2003.html)
- [http://kb.vmware.com/selfservice/search.do?externalId=1003020](http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1003020)

```
w2k3.vmx

ethernet0.virtualDev = "e1000"
ethernet1.virtualDev = "e1000"

```
