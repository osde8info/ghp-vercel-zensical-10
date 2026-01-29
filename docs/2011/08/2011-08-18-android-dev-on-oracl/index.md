---
title: "android dev on oracle linux"
date: 2011-08-18
categories: 
  - "osde"
tags: 
  - "android"
  - "mobdev"
---

## android dev on oracle linux (or centos linux or red hat enterprise linux)

### download sdk

```
$ wget androidsdk
```

### update sdk

```
$ android/android
```

### connect phone(s)

### lsusb to get usb vendor id(s)

```
$ lsusb
Bus 001 Device 005: ID 18d1:4e12 Google Inc. Nexus One (debug)

add vendor id udev config files
# vi /etc/udev/rules.d/58-android.rules
SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", MODE="0666", GROUP="plugdev"	# goog htc
SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", MODE="0666", GROUP="plugdev"	# samsung
```

### disconnect and reconnect phone(s)

since (unlike ubuntu) you can't restart the udev service on oracle linux just unplug and repluig your phone(s)

### list phones

```
$ android-sdk-linux_x86/platform-tools/adb devices
List of devices attached
HT019P807786	device
```

### run ddms

```
$ android-sdk-linux_x86/tools/ddms
(DDMS:12931): Gtk-WARNING **: gtk_widget_size_allocate(): 
attempt to allocate widget with width -5 and height 17
(DDMS:12931): Gtk-WARNING **: gtk_widget_size_allocate(): 
attempt to allocate widget with width -5 and height 17
```
