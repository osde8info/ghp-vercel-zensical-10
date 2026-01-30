---
title: "The @DELL Windows 10 recovery media No Bootable Device error #windows10 #bios #uefi #fail"
date: 2019-01-18
categories: 
  - "osde"
tags: 
  - "bios"
  - "dell"
  - "lenovo"
  - "thinkpad"
  - "uefi"
  - "windows-10"
  - "wndows"
---

According to

- https://www.dell.com/support/article/uk/en/ukbsdt1/sln300634/windows-7-downgrade-computer-fails-to-boot-to-windows-10-recovery-media?lang=en

if you get the error

```
No Bootable Device error when booting to Dell Windows 10 media
```

it is _because all Dell Windows 10 recovery media (Win10 recovery DVD \[Clean install only from DVD\] or WIN10 recovery USB key) require the system BIOS to be configured in the Unified Extensible Firmware Interface (UEFI) mode._

_There will be no changes made to the Dell Windows 10 recovery media because, as **by Microsoft design,** **Windows 10 is intended to be used in the UEFI mode configuration**._

but that CANT be true ? i am sure i have a Lenovo Thinkpad that only has BIOS (not UEFI) that works fine with Windows 10 !
