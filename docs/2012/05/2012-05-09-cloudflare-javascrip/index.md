---
title: "CloudFlare JavaScript Insertions"
date: 2012-05-09
categories: 
  - "osde"
tags: 
  - "cdn"
  - "javascript"
  - "optimisation"
---

CloudFlare JavaScript Insertions

```
<script type="text/javascript">
 //<![CDATA[
 try{
 if (!window.CloudFlare) {
 var CloudFlare=[{
 verbose:0,p:0,byc:0,owlid:0,mirage:0,oracle:0,
 paths:{
 cloudflare:"/cdn-cgi/nexp/v=2965651658/"},
 atok:"2197c6b8e9444be75d3d30d94a3e6afa",zone:"osde.info",rocket:"0",
 apps:{
 "vig_key":{"sid":"f178a9fcc671cf30878ab493f8109613"},
 "ga_key":{"ua":"UA-747268-1","ga_bs":"2"},
 "dnschanger_detector":{
 "fix_url":"http:\/\/www.opendns.com\/dns-changer"}
 }}];
 document.write('
 <script type="text/javascript" src="//ajax.cloudflare.com/cdn-cgi/nexp/v=3037830340/cloudflare.min.js"><'+
 '\/script>')}}
 catch(a){};
 //]]>
</script>
<script type="text/javascript">
 //<![CDATA[
 window.__CF=window.__CF||{};
 window.__CF.AJS={
 "vig_key":{"sid":"f178a9fcc671cf30878ab493f8109613"},
 "ga_key":{"ua":"UA-747268-1","ga_bs":"2"},
 "dnschanger_detector":{"fix_url":"http:\/\/www.opendns.com\/dns-changer"}};
 //]]>
 </script>
```
