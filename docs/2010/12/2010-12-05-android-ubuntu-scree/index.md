---
title: "android ubuntu screenshots"
date: 2010-12-05
categories: 
  - "osde"
---

if you are getting any of the following errors when trying to use adb or ddms to get screenshots from a htc or samsung android mobile phone on a ubuntu pc `$ adb devices List of devices attached ???????????? no permissions` or `$ ddms` `12:39:48 E/DeviceMonitor: Sending jdwp tracking request failed! 12:39:48 E/DeviceMonitor: Failed to start monitoring HT0XXXXXXXX 12:39:48 W/DeviceMonitor: Adb rejected command to get device HT0XXXXXXXX info: device offline` `12:39:50 E/DeviceMonitor: Sending jdwp tracking request failed! 12:39:50 E/DeviceMonitor: Failed to start monitoring HT0XXXXXXXX 12:39:50 W/DeviceMonitor: Adb rejected command to get device HT0XXXXXXXX info: device not found` then try creating a file /etc/udev/rules.d/70-android.rules containing `SUBSYSTEMS=="usb", ATTRS{idVendor}=="04e8", ATTRS{idProduct}=="681c", MODE="0666" # samsung SUBSYSTEMS=="usb", ATTRS{idVendor}=="18d1", ATTRS{idProduct}=="4e12", MODE="0666" # htc` then `# service udev reload` then disconnect reconnect and reenable usb debugging

[![android world wide weather](images/5234437850_9e8edbae4f_m.jpg)](http://www.flickr.com/photos/osde-info/5234437850/ "android world wide weather by osde8info, on Flickr")

see also

- [http://developer.android.com/guide/developing/device.html](http://developer.android.com/guide/developing/device.html "android")
- [https://help.ubuntu.com/community/AndroidScreenshots](https://help.ubuntu.com/community/AndroidScreenshots "ubuntu")
