---
title: "AMD 64-bit and Intel 64-bit confusion !"
date: 2009-12-05
categories: 
  - "osde"
tags: 
  - "64-bit"
  - "amd"
  - "amd-64"
  - "gnu-linux"
  - "intel"
  - "intel-64"
  - "ubuntu"
  - "xubuntu"
---

According to [http://www.debian-administration.org/articles/534](http://www.debian-administration.org/articles/534) Intel _initially chose not to extend their IA-32 processor family to 64 bits, preferring to promote their own but incompatible HP PA-RISC based IA-64 "Itanium" processor family !_

but then Intel _adopted AMD's 64-bit extensions into their IA-32 processor family, calling them "Intel 64" (aka IA-32e and EMT64). Final generation Pentium 4 & D, Celeron D, and Xeon processors and all "Core 2" based processors now include AMD compatible 64-bit extensions._

To add to the confusion [https://help.ubuntu.com/community/ProcessorArch](https://help.ubuntu.com/community/ProcessorArch) lists a few dozen Intel processors but doesn't make it clear which type a Pentium DualCore is ! Which is what my Compaq A900 notebook says it has in it !

I have 4G of RAM that I have only been able to access 3G of so far (with 4 different OS's)

Update :  
It seems that my Pentium DualCore has PAE (?) support and when I install from the [Xubuntu x86 (32-bit ?) CD](http://cdimages.ubuntu.com/xubuntu/releases/karmic/release/xubuntu-9.10-desktop-i386.iso) I CAN see all 4G ! So what benefits if any would I get from using the [Xubuntu 64-bit (AMD64) CD](http://cdimages.ubuntu.com/xubuntu/releases/karmic/release/xubuntu-9.10-desktop-amd64.iso) instead ?

My SONY PIII says it is:  
$ cat /proc/cpuinfo  
processor    : 0  
vendor\_id    : GenuineIntel  
cpu family    : 6  
model        : 13  
model name    : Intel(R) Pentium(R) M processor 1.50GHz  
cpuid level    : 2  
flags        : fpu vme de pse tsc msr mce cx8 sep mtrr pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe up bts est tm2

My Compaq Pentium Dual Core says it is:  
$ cat /proc/cpuinfo  
processor    : 0  
vendor\_id    : GenuineIntel  
cpu family    : 6  
model        : 15  
model name    : Intel(R) Pentium(R) Dual  CPU  T2390  @ 1.86GHz  
cpuid level    : 10  
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm constant\_tsc arch\_perfmon pebs bts pni dtes64 monitor ds\_cpl est tm2 ssse3 cx16 xtpr pdcm lahf\_lm

[Read and post comments](http://osde-info.vox.com/library/post/amd-64-bit-and-intel-64-bit-confusion.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e0123ddeeae58860d?_c=feed-atom-full)
