---
title: "sometimes webpage font sizes are very tiny when you print them !"
date: 2008-05-16
categories: 
  - "osde"
tags: 
  - "bug"
  - "css"
  - "firefox"
  - "font"
  - "font-size"
  - "print-preview"
  - "printing"
  - "webdesign"
  - "webdev"
---

I think I've just worked out why this happens ! Maybe it's because there is no CSS at all so that firefox 2.0.0.13 uses default system font-size (14px) or the text font size (in the CSS file) has been specified in pixels (px) instead of points (pt) !

i.e.

> body { font-size: **12px**; }  

instead of

> body { font-size: **12pt**; }  

This seems to be the problem with the [WikkaWiki](http://wikkawiki.org/HomePage) CSS style sheets so i've created a ticket [http://wush.net/trac/wikka/ticket/764](http://wush.net/trac/wikka/ticket/764) and fixed my own [WikkaWiki](http://wikkawiki.org/HomePage) sites !

Here is what print / print preview looks like before and after you've added / fixed your firefox and/or CSS !  

[![firefox 2.0.0.13 print preview bug](images/6a00d4141b9517685e00fa9676d4a10003.jpg "firefox 2.0.0.13 print preview bug")](http://osde8info.wordpress.com/wp-content/uploads/2008/05/6a00d4141b9517685e00fa9676d4a10003.jpg)

[firefox 2.0.0.13 print preview bug](http://osde8info.wordpress.com/wp-content/uploads/2008/05/6a00d4141b9517685e00fa9676d4a10003.jpg "firefox 2.0.0.13 print preview bug")

[![linux.die.net](images/6a00d4141b9517685e00fad6889ede0004.png "linux.die.net")](http://osde8info.wordpress.com/wp-content/uploads/2008/05/6a00d4141b9517685e00fad6889ede0004.png)

[linux.die.net](http://osde8info.wordpress.com/wp-content/uploads/2008/05/6a00d4141b9517685e00fad6889ede0004.png "linux.die.net")

  

  

  

[Read and post comments](http://osde-info.vox.com/library/post/sometimes-webpage-font-sizes-are-very-tiny-when-you-print-them.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00fad6878a670005?_c=feed-atom-full)
