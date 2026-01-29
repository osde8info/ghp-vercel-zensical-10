---
title: "Web Browser \"standards mode\" &amp; \"quirks mode\" and doctypes in html &amp; xhtml"
date: 2007-08-19
categories: 
  - "osde"
tags: 
  - "apache"
  - "doctype"
  - "html"
  - "http"
  - "lamp"
  - "php"
  - "xhtml"
  - "xml"
---

[W3C QA - Recommended list of DTDs you can use in your Web document](http://www.w3.org/QA/2002/04/valid-dtd-list.html)

If you search for Web Browser "standards mode", "quirks mode" and doctype, html, xhtml, xml you'll find plenty of information about the "problem" that certain browsers have but little about the "solution" !

I'm still confused but thinking that a solution might just to use PHP instead of HTML and add the following  header to my web pages

`    <? // if (HTTP_USER_AGENT <> a-bad-browser) echo "<?doctype ...stuff...>" ?>    `

Before I actually code this in PHP do you think it would work ?

Or do you have a better solution ?  

[Read and post comments](http://osde-info.vox.com/library/post/web-browser-standards-mode-quirks-mode-and-doctypes-in-html-xhtml.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00e3989f2f4c0004?_c=feed-atom-full)
