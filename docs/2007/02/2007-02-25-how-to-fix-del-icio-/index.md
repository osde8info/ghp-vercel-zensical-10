---
title: "How to fix del.icio.us Firefox \"Unresponsive Script\" errors"
date: 2007-02-25
categories: 
  - "osde"
tags: 
  - "del-icio-us"
  - "error"
  - "firefox"
  - "javascript"
  - "mozilla"
  - "semantic-web"
  - "social-network"
  - "unresponsive-script"
---

Sometimes the [del.icio.us](http://del.icio.us/help/) web 2.0 social bookmarking AJAX javascripts run a bit slowly and Firefox gives you an "Unresponsive Script" error. Original solution posted by [Lifehacker](http://lifehacker.com/software/firefox/put-off-firefox-15s-unresponsive-script-dialogue-162574.php). Thank you !

The solution is to increase the value of Firefoxs script timeout from 10 to 25

1. Type about:config
2. Filter by "max"
3. Change dom.max\_script\_run\_time from 10 to 25 (by double clicking on the value)

[![Firedommax](images/6a00d4141b9517685e00d41426e0643c7f.png "Firedommax")](http://osde8info.wordpress.com/wp-content/uploads/2007/02/6a00d4141b9517685e00d41426e0643c7f.png)

[Firedommax](http://osde8info.wordpress.com/wp-content/uploads/2007/02/6a00d4141b9517685e00d41426e0643c7f.png "Firedommax")

See also  
[http://www.mozilla.org/catalog/end-user/customizing/briefprefs.html](http://www.mozilla.org/catalog/end-user/customizing/briefprefs.html)  
and  
[http://kb.mozillazine.org/Knowledge\_Base](http://kb.mozillazine.org/Knowledge_Base)

Finally here are [my del.icio.us bookmarks](http://del.icio.us/osde.info)  

[Read and post comments](http://osde-info.vox.com/library/post/howto-fix-firefox-delicious-unresponsive-script-errors.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00d41423ea3c3c7f?_c=feed-atom-full)
