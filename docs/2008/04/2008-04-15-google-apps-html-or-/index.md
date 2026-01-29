---
title: "Google Apps HTML or CNAME verification"
date: 2008-04-15
categories: 
  - "osde"
tags: 
  - "cname"
  - "dns"
  - "google-apps"
  - "html"
  - "subdomain"
  - "verification"
---

Google Apps now has two ways to verify your domain ownership.

You can either upload an **HTML** file with a ID specified by Google, or you can change the **CNAME** record for your domain using a SUBdomain specified by Google.

**HTML**  

1. Create a HTML verification file named "googlehostedservice.html" ,
2. Copy the ID (googleAAAABBBBCCCCDDDD) into it, and upload it to http://your.domain/ .      
3. Once you have made the changes, make sure you can see the file at http://your.domain/googlehostedservice.html.

  
**CNAME**  

1. Sign in to your Domain Hosting Service and locate the DNS management page.
2. Use the SUBdomain to create a new CNAME record: googleAAAABBBBCCCCDDDD.your.domain
3. And point the CNAME record to:google.com

[Read and post comments](http://osde-info.vox.com/library/post/google-apps-html-cname-verification.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00f48ceebfa20002?_c=feed-atom-full)
