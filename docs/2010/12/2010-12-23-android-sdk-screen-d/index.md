---
title: "android sdk screen dumps broken"
date: 2010-12-23
categories: 
  - "osde"
tags: 
  - "android"
  - "mobdev"
  - "mobile"
  - "open-source"
---

if you update your [google android sdk](http://developer.android.com/sdk/installing.html "android") you may find that Ctrl-S screen dumps are now broken and it just says "Screen Unavailable" this may be because in the latest SDK 8 google have split the binarys (adb, ddms, etc) into two subdirectories /tools and /platform-tools

try re-editing your bashrc so that your PATH  includes both these subdirs

```
export PATH=${PATH}:<android-sdk-linux_x86>/tools:<android-sdk-linux_x86>/platform-tools

```

rerun ddms and try a Ctrl-S screenshot again
