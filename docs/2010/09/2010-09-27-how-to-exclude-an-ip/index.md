---
title: "how to exclude an ip range from goog analytics"
date: 2010-09-27
categories: 
  - "osde"
tags: 
  - "analytics"
---

how to exclude an ip range from your google analytics reports

- generate  a regexp for the IP range you wish to exclude by using the [goog regexp generator](https://www.google.com/support/googleanalytics/bin/answer.py?answer=55572 "goog")
- add the regexp to a [goog analytics 'custom exclude filter'](https://www.google.com/support/googleanalytics/bin/answer.py?answer=55481&hl=en_GB&utm_id=ad "goog")
- add the exclude filter to your goog analytics website profile(s)
