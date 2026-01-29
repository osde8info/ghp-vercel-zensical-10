---
title: "Now goog own your apache logs !"
date: 2010-09-25
categories: 
  - "osde"
tags: 
  - "analytics"
  - "mobile"
  - "webdev"
---

Due to the googles  Google Wireless Transcoder 'bot' its now even more important to enable and check the X-Forwarded-For records in your apache access logs ! There will now be an even bigger mismatch between you apache httpd access logs, awstats or webalizer visitor reports and your google analytics visitor reports !

Look in your apache httpd access logs and you may see you are now getting a lot of new visitors from Mountain View, CA, USA with the IP range [74.125.0.0 - 74.125.255.255](http://whois.domaintools.com/74.125.0.0 "domaintools").

Look closely at the user agent and you may find these are in fact from the [Google Wireless Transcoder](http://www.botsvsbrowsers.com/ip/74.125.?.?/index.html "botsvsbrowsers") 'bot'

'AppleWebKit/525.13 (KHTML, like Gecko; Google Wireless Transcoder)'

which is actually a proxy server that is reformatting your pages for mobile devices so your actual visitors could be coming from any mobile user using the google mobile symbian app from anywhere in the world !

So make you are use X-Forwarded-For in your [appache httpd logformat](http://fsse.info/LogFormat "fsse") instead of the host ip as appropriate to determine where your vistors are actually coming from !

See [http://www.maretmanu.org/homepage/inform/apache-forwarded.php](http://www.maretmanu.org/homepage/inform/apache-forwarded.php) for more info but watch out as the X-Forwarded-For may not be a single IP but actually be a list of IPs and I have noticed that in my case GWT has listed my UK mobiles IP address twice separated by a comma ! ie [217.171.128.x](http://whois.domaintools.com/217.171.129.0 "domaintools"),[217.171.128.x](http://whois.domaintools.com/217.171.129.0 "domaintools")
