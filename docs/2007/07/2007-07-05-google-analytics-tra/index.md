---
title: "Google Analytics - Tracking Not Installed"
date: 2007-07-05
categories: 
  - "osde"
tags: 
  - "analytics"
  - "google"
  - "sem"
  - "seo"
  - "web-analytics"
---

I've just discovered that "Google Analytics" gives you the "Tracking Not Installed" error if you using  HTTP  redirects  

```none
<?php header( 'location: login.php' ) ; ?>
```

so you must (temporarily ?) rewrite you code so that the google script is included DIRECTLY in the first page on your website  

```none
<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script><script type="text/javascript">_uacct = "UA-747268-6";urchinTracker();</script>
```

[Read and post comments](http://osde-info.vox.com/library/post/google-analytics---tracking-not-installed.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00cd973cf4214cd5?_c=feed-atom-full)
