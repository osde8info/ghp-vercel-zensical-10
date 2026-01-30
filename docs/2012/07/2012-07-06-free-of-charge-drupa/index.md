---
title: "free of charge (?) drupal and wordpress sites from red had open shift"
date: 2012-07-06
categories: 
  - "osde"
tags: 
  - "cloud"
  - "open-shift"
  - "red-hat"
---

[https://openshift.redhat.com/app/](https://openshift.redhat.com/app/)

From the Red Hat Open Shift FAQ:

_Q:_

_I have deployed my app, but I don’t like telling people to visit <my\_app>-<my\_namespace>.rhcloud.com so how can I set up my own domain name to point to my app?_

_A:_

_You can now use your own Domain name to access your application._

_You just need to:_

1. _Use the rhc client tools to run > rhc app add-alias -a {appName} --alias {www.yourDomain.com}_
2. _Then in your DNS management for www.yourDomain.com you can add a cname to point www.yourDomain.com to appName-namespace.rhcloud.com._
