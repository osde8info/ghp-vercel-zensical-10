---
title: "are @sainsburys £99 #lowspec @hp ac100na @microsoftuk #windows notebooks a waste of time and money ? #mktg #fail"
date: 2019-02-17
categories: 
  - "osde"
tags: 
  - "10"
  - "celeron"
  - "hp"
  - "intel"
  - "lenovo"
  - "sainsburys"
  - "upgrade"
  - "windows"
---

are @sainsburys £99 #lowspec @hp ac100na @microsoftuk #windows notebooks a waste of time and money ? #mktg #fail

the sainsburys hp ac100na is a low spec intel celeron N3050 with 2G ram and 30G disk

it is almost impossible to upgrade it from windows 10 1709 to 1803 or 1809 but if you have 100 spare hours and follow these hacks you can however you may just prefer to try and return it to sainsburys or throw it away in your nearest WEEE recycling bin

hacks required to upgrade to windows 10 version 1809 on a hp ac100na

- turn on flight mode (to prevent auto updates over wifi)
- run disk clean-up (this takes around 4 hours each run)
- select delete all previous versions
- watch out for the nasty disk clean-up bug (see below)
- reboot
- ensure you have at least 12G of free disk space
- turn off flight mode (to allow auto updates to kick in)
- allow auto update to run
- restart after a few updates have downloaded (do not wait for all updates to download or you will run out of diskspace)
- hopefully these partial updates will get installed on restart

REPEAT the above steps until windows 10 1803 and windows 10 1809 have been installed

and if you get any windows 10 version 1809 0x80070002 errors DO NOT click retry but keep REPEATING the above steps until windows 10 1803 and windows 10 1809 have been installed

![win1809fail](images/win1809fail.png)

so if you havent given up and get lucky you should end up with a 1809 install confirmation screen

![win1809](images/win1809.png)

the nasty windows 10 disk clean-up bug

disk clean-up randomly injects a compress your drive option into list of folders to clean up so you cannot just tick all the folders without reading every one carefully

![wincomp](images/wincomp.png)

footnote MOST but not all intel celerons are rubbish for example the intel celeron N2840 used in lenovo ideapad flex 10 is actually amazing and appears to be 10x faster than the intel celeron N3050
