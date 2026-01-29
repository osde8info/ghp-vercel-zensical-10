---
title: "Ultimate Ubuntu Dual Boot"
date: 2011-03-01
categories: 
  - "osde"
tags: 
  - "floss"
  - "gnu-linux"
  - "ubuntu"
---

I have had a lot of problems dual booting Operating Systems in the past and for the last 4 years i have left my corporate or vender provided OS installed on the desktop or notebook HD and used VMware Player to run Ed/X/Ubuntu VMs on my PCs ! but i have just discovered another way if your corporate lets you have access to the BIOS and hasnt glued up all your USB ports !

Ubuntu booting from an external USB disk !

You'll need

- BIOS access enabled (to check/set the following settings)
- BIOS CD/DVD boot support enabled
- BIOS USB boot support enabled
- Check BIOS boot order is CD -> USB -> HD
- A spare USB port
- An external unused USB HD
- An ed/x/ubuntu CD/DVD

How to build Ubuntu on your external USB HD

- Insert CD and plug in your USB HD
- Boot from CD
- Choose MANUAL partition options
- Check which disk is which (typically internal hd is  /dev/sda and external is /dev/sdb)
- Install Ubuntu to /dev/sdb
- Install GRUB to /dev/sdb (VERY IMPORTANT esp if you want to plug USB HD into other PCs as well !)
- Reboot from USB HD

You should now see Ubuntu running with your original OS and HD completely UNTOUCHED !

So now your friends have two ways to try a free libre open source OS instead of any pre-installed proprietary one !

- Install VMware Player and run an Ubuntu VM
- Install NOTHING and run Ubuntu from an external USB HD

I have tried this with Ubuntu, Xubuntu and Ubuntu Studio but any varient of ED/X/Ubuntu  should work fine ! [![compaq a900 ubuntu studio 10.04](images/5482152987_b7e58892ed_m.jpg)](http://www.flickr.com/photos/osde-info/5482152987/ "compaq a900 ubuntu studio 10.04 by osde8info, on Flickr")

[![ubuntu booting from external usb hd](images/5482624685_19b46ca63d_m.jpg)](http://www.flickr.com/photos/osde-info/5482624685/ "ubuntu booting from external usb hd by osde8info, on Flickr")
