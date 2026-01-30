---
title: "microcode - everything you ever wanted to know"
date: 2018-02-19
categories: 
  - "osde"
tags: 
  - "amd"
  - "intel"
  - "microcode"
---

microcode - everything you ever wanted to know

you need forget everything you thought you knew about microcode was in the old Z80 days

- https://www.techopedia.com/definition/8332/microcode
- https://en.wikipedia.org/wiki/Microcode

run cat /proc/cpuinfo to see what cpu chip & microcode version you have

```
$ cat /proc/cpuinfo 
vendor_id : GenuineIntel
cpu family : 6
model : 69
model name : Intel(R) Core(TM) i5-4310U CPU @ 2.00GHz
microcode : 0x1d
flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr 
pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall 
nx pdpe1gb rdtscp lm constant_tsc arch_perfmon nopl xtopology 
tsc_reliable nonstop_tsc eagerfpu pni pclmulqdq ssse3 fma cx16 
pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes 
xsave avx f16c rdrand hypervisor lahf_lm abm invpcid_single 
retpoline kaiser fsgsbase tsc_adjust bmi1 avx2 smep bmi2 
invpcid xsaveopt arat
bugs : cpu_meltdown spectre_v1 spectre_v2
bogomips : 5202.00
```

 

have a look at your logs to see if you have any microcode patches

```
dmesg | grep "microcode"

journalctl -b -k | grep "microcode"
```

 

you need to enable nonfree deb/rpm repos so you get access to microcode packages

```
deb http://deb.debian.org/debian jessie main contrib non-free
deb http://security.debian.org/ jessie/updates main contrib non-free
```

 

then install the microcode package

```
aptitude update
aptitude install amd64-microcode
```

 

check your kernels params and reboot

- https://wiki.debian.org/Microcode
- https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html
- https://lists.debian.org/debian-devel/2012/11/msg00109.html

 

Notes

_Unfortunately, the license of the microcode update data from AMD and Intel are not compatible with the Debian Free Software Guidelines._ _Therefore, microcode update data will be available through the non-free distribution. The new processor microcode update system is available for both non-free Wheezy and non-free Squeeze (through the backports repository)._

_**Meltdown (the vulnerability affecting only Intel chips) cannot be fixed with microcode updates alone and requires changes to core OS functionality, which may reduce performance further.**_

_Spectre (the vulnerability affecting Intel, AMD and ARM chips) may be able to be worked around with microcode updates alone._
