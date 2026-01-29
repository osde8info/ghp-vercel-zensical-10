---
title: "Unicode, UTF-8, UTF-16, UCS-2, UCS-4 and URIs"
date: 2008-04-25
categories: 
  - "osde"
tags: 
  - "browser"
  - "ucs"
  - "ucs-2"
  - "ucs-4"
  - "unicode"
  - "uri"
  - "utf"
  - "utf-16"
  - "utf-8"
---

Unicode can be confusing !

For a start there are a number of different encodings such as :  

- UTF-8 (for example **€** in UTF-8 is **0x****E2** **0x****82** **0x****AC)**
- UTF-16 (which uses surrogate pairs to represent "characters" outside the Basic Multilingual Plane (BMP)  
    
- UCS-2 (a predecessor of UTF-16)
- UCS-4

A RFC-2396 URI must be encoded / escaped using UTF-8 (and %hex-values) so if you want to acccess a web page called  

- http://my.host/**€**.php

the URI will be  

- http://my.host/**%E2%82%AC**.php

and different browsers seem to work with Unicode URIs in different ways !  

- Safari works with both (**€**.php and **%E2%82%AC**.php) and helpfully (?) redisplays **%E2%82%AC**.php as **€**.php in the address bar
- Firefox converts **€**.php (sometimes incorrectly to **%80**.php) so you can only use / see **%E2%82%AC**.php
- IE works with both (**€**.php and **%E2%82%AC**.php) but leaves both versions unchanged in the address bar

[Read and post comments](http://osde-info.vox.com/library/post/unicode-utf-8-utf-16-ucs-2-ucs-4-and-uris.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00e398f367e20005?_c=feed-atom-full)
