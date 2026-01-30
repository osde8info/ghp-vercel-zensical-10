---
title: "android sdk manager doesnt work with openjdk"
date: 2013-04-30
categories: 
  - "osde"
tags: 
  - "android"
  - "bug"
  - "java"
  - "openjdk"
  - "sdk"
---

android sdk manager doesnt work with openjdk

[![android debug monitor](images/8694808349_157706c885_n.jpg)](http://www.flickr.com/photos/osde-info/8694808349/ "android debug monitor by osde8info, on Flickr")

```
Fetching https://dl-ssl.google.com/android/repository/addons_list-2.xml

Fetched Add-ons List successfully

Fetching URL: https://dl-ssl.google.com/android/repository/repository-7.xml

Done loading packages.

Fetching https://dl-ssl.google.com/android/repository/addons_list-2.xml

Failed to fetch URL https://dl-ssl.google.com/android/repository/addons_list-2.xml, reason: java.security.NoSuchAlgorithmException: Error constructing implementation (algorithm: Default, provider: SunJSSE, class: sun.security.ssl.SSLContextImpl$DefaultSSLContext)

Fetched Add-ons List successfully

Fetching URL: https://dl-ssl.google.com/android/repository/repository-7.xml

Failed to fetch URL https://dl-ssl.google.com/android/repository/repository-7.xml, reason: Socket java.security.NoSuchAlgorithmException: Error constructing implementation (algorithm: Default, provider: SunJSSE, class: sun.security.ssl.SSLContextImpl$DefaultSSLContext)

Done loading packages.
```
