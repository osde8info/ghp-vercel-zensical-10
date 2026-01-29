---
title: "IE, 32bit, 64bit, flash &amp; java"
date: 2010-10-01
categories: 
  - "osde"
tags: 
  - "webdev"
---

Windoz 7 64-bit operating system has both IE8 32-bit and IE8 64-bit web browsers.

[![m$ ie8 32-bit](images/5041031037_46c202783b_t.jpg)](http://www.flickr.com/photos/osde-info/5041031037/ "m$ ie8 32-bit by osde8info, on Flickr") [![m$ ie8 64-bit](images/5041031097_103f5d4c85_t.jpg)](http://www.flickr.com/photos/osde-info/5041031097/ "m$ ie8 64-bit by osde8info, on Flickr")

If you want to use the Java plugin with both of them you'll need to download and install Java 32 bit and Java 64 bit !

- [http://java.com/en/download/manual.jsp](http://java.com/en/download/manual.jsp "java")
- [http://java.com/en/download/faq/java\_win64bit.xml](http://java.com/en/download/faq/java_win64bit.xml "java")

You should see that the 64 bit edition of Java gets installed into

C:\\Program Files\\Java

and that 32 bit edition of Java gets installed into

C:\\Program Files (x86)\\Java

To check if you are running 32bit or 64bit apps run task manager and look on the processes tab and you should see that 32bit apps have  a "\*32" appended to their image name.

Note there is currently only a 32bit version of the Adobe Flash Player plugin !

If you are interested in which version visitors to your webpage are using you can look at the http browser headers for the 32 bit browser

```
Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1;
WOW64; Trident/4.0;
SLCC2;
.NET CLR 2.0.50727;
.NET CLR 3.5.30729; .NET CLR 3.0.30729;
Media Center PC 6.0; InfoPath.2; .NET4.0C; .NET4.0E)
```

and the 64 bit browser

```
Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1;
Win64; x64; Trident/4.0;
.NET CLR 2.0.50727;
SLCC2;
.NET CLR 3.5.30729; .NET CLR 3.0.30729;
Media Center PC 6.0; .NET4.0C; .NET4.0E)
```
