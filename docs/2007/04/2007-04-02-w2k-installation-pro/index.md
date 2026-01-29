---
title: "W2K installation process"
date: 2007-04-02
categories: 
  - "osde"
tags: 
  - "ie"
  - "install"
  - "update"
  - "virtual-machine"
  - "vmware-server"
  - "w2k"
---

Unfortunately I just had a requirement (need to run an EXE that creates a BIOS update floppy) for a W2K virtual machine. I haven't built one from scratch for over four years. Here's the sequence I used on a VMware Server guest in case I need to do it again in another four years !

Install  

- W2K Professional
- W2K SP4 (reboot)  
    
- Install VMware tools (reboot)
- Uninstall Outlook Express
- Uninstall Indexing Service
- IE6 (Windows update is broken in W2K IE5) (reboot)
- Windows Update (Why does it insist on patching Outlook Express even thou I've uninstalled it ?)
- Sun Java JVM

Defrag  
Shrink VMDK by 50% (with VMware tools from 3.2G to 1.6G)  
Backup (tgz w2k.tgz /vmfs/w2k)

W2K is now ready for action ! Lucky I still have one PC with a floppy disk !  

[Read and post comments](http://osde-info.vox.com/library/post/w2k-installation-process.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00d4142a6e506a47?_c=feed-atom-full)
