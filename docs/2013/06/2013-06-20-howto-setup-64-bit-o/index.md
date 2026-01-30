---
title: "howto setup 64-bit #oracle #gnu/#linux 6 to run 32-bit apps such as the #android #sdk"
date: 2013-06-20
categories: 
  - "osde"
tags: 
  - "32-bit"
  - "64-bit"
  - "android"
  - "apps"
  - "gnu-linux"
  - "oracle"
  - "sdk"
---

to setup 64-bit oracle gnu/linux 6 to run 32-bit apps such as the android sdk you first need to install some 32 bit librarys

```
# yum install glibc.i686 glibc-devel.i686 libstdc++.i686 ncurses-libs
```

this should prevent you getting errors such as

```
bash: 
android-sdk-linux/platform-tools/adb: 
/lib/ld-linux.so.2: 
bad ELF interpreter: 
No such file or directory
```

and

```
android-sdk-linux/platform-tools/adb: 
error while loading shared libraries: 
libncurses.so.5: 
cannot open shared object file: 
No such file or directory
```

see also

- https://ask.fedoraproject.org/question/8969/installing-android-sdk-on-64-bit-fedora/
- http://fedoraproject.org/wiki/HOWTO\_Setup\_Android\_Development
