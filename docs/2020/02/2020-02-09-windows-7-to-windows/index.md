---
title: "Windows 7 to Windows 10 upgrade tips"
date: 2020-02-09
categories: 
  - "osde"
tags: 
  - "wi-fi"
  - "windows-10"
  - "windows-7"
  - "wireless"
---

Windows 7 updates still seem to be working but you wont get any new updates in the future.

![win7up](images/win7up.png)

The Windows 10 upgrade seems to work pretty well even with old hardware so if you are still running an unsupported Windows 7 PC its worthwhile creating the [Windows 10 installation media / iso](https://www.microsoft.com/en-gb/software-download/windows10)

then when prompted by Windows 10 installer / updater for a licence key try using your existing Windows 7 key from the sticker on the back of your pc - you might get lucky - otherwise leave it blank

One exception i have found was an old [SAMSUNG NP-Q35](https://www.samsung.com/uk/support/model/NP-Q35T009/SUK/) with an Intel Core 2 T7200 which had multiple Windows 10 audio, video, usb & wireless driver problems:

intel 945 express

_Your computer's system firmware does not include enough information to properly configure and use this device. To use this device, contact your computer manufacturer to obtain a firmware or BIOS update. (Code 35)_

intel 82801 GBM/GHM (ICH-7)

multiple errors

intel pro/wireless 3945 ABG

          dead

audio

dead

you can get around the intel pro/wireless with a realtek rtl8723b usb wifi dongle (~ £10)

- [EDIMAX](https://amzn.to/2uzFVd4)
- [FAGORY](https://amzn.to/2SygCQz)
- [KuWFi](https://amzn.to/2Swph6b)
- [TP-LINK](https://amzn.to/39iAfmC)

[![](images/q)](https://www.amazon.co.uk/dp/B01INRAC2C/ref=as_li_ss_il?ie=UTF8&linkCode=li2&tag=devops21-21&linkId=dafd97fc87c5fb3ae61638d64b147e23&language=en_GB)![](images/ir)

finally if your cant get your old hardware to work with Windows 10 try upcycling it by replacing Windows 7 with [LinuxLiteOS](https://www.linuxliteos.com/)
