---
title: "linuxlite howto aptitude upgrade chromium*"
date: 2018-04-26
categories: 
  - "osde"
tags: 
  - "aptitude"
  - "linuxlite"
  - "packages"
  - "upgrade"
  - "wildcard"
---

on linuxlite if you want to aptitude upgrade chromium\* packages you need to prefix chromium with "~n"

```
# aptitude safe-upgrade ~nchromium
```
