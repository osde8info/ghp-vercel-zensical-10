---
title: "toshiba satellite C660 windows 7 intel drivers"
date: 2013-04-24
categories: 
  - "osde"
tags: 
  - "drivers"
  - "intel"
  - "toshiba"
  - "windoz"
---

if you are rebuilding / reinstalling a toshiba satellite C660 windows 7 64 bit notebook from your recovery dvds there are a couple of issues to watch out for with the default toshiba provided intel drivers

1. The Intel(R) Management and Security Application Local Management Service service may fail to start  and generate errors in your system log.
2. The Intel(R) HD Graphics Drivers depend on DOTNET 3 !

Solutions

- download and reinstall the Intel Management Interface drivers from http://www.toshiba.co.uk/innovation/download\_drivers\_bios.jsp?service=UK
- DO NOT uninstall DOT NET 3

[![a](images/8676611359_7f5dcbd938_m.jpg)](http://www.flickr.com/photos/osde-info/8676611359/ "a by osde8info, on Flickr")

System Logh errors you may see,

```
The Intel(R) Management and Security Application Local Management Service 
service failed to start due to the following error: 
This version of Intel(R) Management and Security Application Local 
Management Service is not compatible with the version of Windows you're 
running. Check your computer's system information to see whether you 
need a x86 (32-bit) or x64 (64-bit) version of the program, and then 
contact the software publisher.

The Intel(R) Management & Security Application User Notification Service 
service depends on the Intel(R) Management and Security Application Local 
Management Service service which failed to start because of the following 
error: 
This version of Intel(R) Management & Security Application User 
Notification Service is not compatible with the version of Windows you're 
running. Check your computer's system information to see whether you need 
a x86 (32-bit) or x64 (64-bit) version of the program, and then contact 
the software publisher.
```
