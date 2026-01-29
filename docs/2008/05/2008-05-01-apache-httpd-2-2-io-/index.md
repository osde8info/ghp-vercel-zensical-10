---
title: "Apache HTTPD 2.2 I/O &amp; forensic logging !"
date: 2008-05-01
categories: 
  - "osde"
tags: 
  - "apache"
  - "debug"
  - "forensics"
  - "httpd"
  - "input-output"
  - "log"
  - "log-files"
  - "secuity"
  - "server"
  - "web-development"
  - "webdev"
---

I've been readin the Apache Httpd Logs documentation for version 1.3, 2.0 and 2.2 :

- [http://httpd.apache.org/docs/1.3/logs.html](http://httpd.apache.org/docs/1.3/logs.html)
- [http://httpd.apache.org/docs/2.0/logs.html](http://httpd.apache.org/docs/2.0/logs.html)
- [http://httpd.apache.org/docs/2.2/logs.html](http://httpd.apache.org/docs/2.2/logs.html)

and noticed that in Apache Httpd 2.2 there are a couple of new modules / features that could be very useful for any development servers you run !

_`[mod_logio](http://httpd.apache.org/docs/2.2/mod/mod_logio.html)` adds in two additional `[LogFormat](http://httpd.apache.org/docs/2.2/mod/mod_log_config.html#logformat)` fields (%I and %O) that log the actual number of bytes received and sent on the network._

_`[mod_log_forensic](http://httpd.apache.org/docs/2.2/mod/mod_log_forensic.html)` provides for forensic logging of client requests. Logging is done before and after processing a request, so the forensic log contains two log lines for each request. The forensic logger is very strict with no customizations. It can be an invaluable debugging and security tool._  

[Read and post comments](http://osde-info.vox.com/library/post/apache-httpd-22-io-forensic-logging.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00f48d126a990001?_c=feed-atom-full)
