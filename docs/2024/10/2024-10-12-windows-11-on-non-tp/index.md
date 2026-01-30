---
title: "Windows 11 on non TPM PCs"
date: 2024-10-12
categories: 
  - "osde"
---

To install/upgrade to Windows 11 on a non secureboot and/or non TPM 1.2 or TPM 2.0 PC

You can

mout windows ISO and run

```
setup.exe /product server
```

or

- Download Balena Etcher

- Download Kubuntu ISO

- Download Rufus

- Download Windows 11 ISO

- Find 2 x 8G USB sticks

Download the 4 items listed above

Use Balena Etcher to burn Kubuntu on one USB Stick

Use Rufus to burn Windows 11 ISO on to the other USB stick

Change BIOS settings to UEFI boot

Boot from Kubuntu stick

Change existing disk from MBR to GPT

Boot from Windows 11 stick

[![](images/image.png)](https://osde8info.wordpress.com/wp-content/uploads/2024/10/image.png)
