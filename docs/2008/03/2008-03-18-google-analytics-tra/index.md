---
title: "Google Analytics tracking javascript code"
date: 2008-03-18
categories: 
  - "osde"
tags: 
  - "analytics"
  - "google"
  - "statistics"
  - "web-analytics"
  - "webdev"
---

Google Analytics have released a NEW version of their [tracking javascript code](https://www.google.com/support/googleanalytics/bin/answer.py?answer=55488&hl=en_GB) (**ga.js)** so create the following two javascript files:

**googanala.js  
**var gaJsHost = ( ("https:" == document.location.protocol) ? "https://ssl." : "http://www." ) ;

document.write(  
                unescape(  
                        "%3C" +  
                        "script type='text/javascript' " + "src='" + gaJsHost + "google-analytics.com/ga.js' " +  
                        "%3E" +

                        "%3C" +  
                        "/script" +  
                        "%3E"  
                )  
        );

**googanalb.js  
**var pageTracker = \_gat.\_getTracker("UA-999999-9");  
pageTracker.\_initData();  
pageTracker.\_trackPageview();

and include the following two lines in your footer

script type="text/javascript" src="googanala.js" /script  
script type="text/javascript" src="googanalb.js" /script

with **angle brackets** added back in !  

[Read and post comments](http://osde-info.vox.com/library/post/google-analytics-tracking-javascript-code.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00e398e714d40005?_c=feed-atom-full)
