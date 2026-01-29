---
title: "python funkload loadtesting"
date: 2011-03-09
categories: 
  - "osde"
tags: 
  - "floss"
  - "open-source"
  - "sysadmin"
  - "webdev"
---

## howto get python [funkload](http://funkload.nuxeo.org/ "funkload") loadtesting working

### install python 2.6

### install funkload

### fix webunit bugs

### \# vi /usr/lib/python2.6/dist-packages/webunit/cookie.py

\# domain-match the Domain attribute. ##if not server.endswith(domain): ##if not domain.endswith(server): if not (domain.endswith(server) or server.endswith(domain)): raise Error, 'Cookie domain "%s" doesn\\'t match '\\ 'request host "%s"'%(domain, server) # reject if The request-host is a FQDN (not IP address) and # has the form HD, where D is the value of the Domain # attribute, and H is a string that contains one or more dots. ## if re.search(r'\[a-zA-Z\]', server): ## H = server\[:-len(domain)\] ## if '.' in H: ## raise Error, 'Cookie domain "%s" too short '\\ ## 'for request host "%s"'%(domain, server)

### record a test by running the funkload proxy and setting firefox browser to use it

$ fl-record mywebsite ^C

should create

Mywebsite.conf test\_Mywebsite.py

### autorun the test

$ fl-run-test -dv test\_Mywebsite.py

### autorun bench test(s)

$ fl-run-bench test\_Mywebsite.py Mywebsite.test\_mywebsite

$ fl-run-bench -c1:10:20 test\_Mywebsite.py Mywebsite.test\_mywebsite

### create text and html reports

$ fl-build-report --no-percentiles mywebsite-bench.xml >mywebsite.txt $ cat ~/efip.txt

$ fl-build-report --html --no-percentiles mywebsite-bench.xml $ firefox file:///~/test\_efip-20110309T173138/index.html

### NOTE: watch out for correct use of case of mywebsite and Mywebsite
