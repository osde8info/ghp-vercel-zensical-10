---
title: "new goog analytics js"
date: 2010-09-28
categories: 
  - "osde"
tags: 
  - "analytics"
---

google have released a new asynchronous analytics js snippet

see [http://code.google.com/apis/analytics/docs/tracking/asyncTracking.html](http://code.google.com/apis/analytics/docs/tracking/asyncTracking.html)

and [http://code.google.com/apis/analytics/docs/tracking/asyncUsageGuide.html](http://code.google.com/apis/analytics/docs/tracking/asyncUsageGuide.html)

```
<script type="text/javascript">
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-XXXXXX-Y']);
_gaq.push(['_setDomainName', '.fsse.info']);
_gaq.push(['_trackPageview']);
(function() {
var ga = document.createElement('script');
ga.type = 'text/javascript';
ga.async = true;
ga.src =
('https:' == document.location.protocol ? 'https://ssl' : 'http://www') +
'.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0];
s.parentNode.insertBefore(ga, s);
})();
</script>
```
