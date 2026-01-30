---
title: "mysql uuid gotchas"
date: 2012-08-06
categories: 
  - "osde"
tags: 
  - "dba"
  - "guid"
  - "mysql"
  - "uud"
  - "uuid"
---

http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html#function\_uuid

mysql uuid gotchas

- _Two calls to [`UUID()`](http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html#function_uuid) are **expected** to generate two different values, even if these calls are performed on two separate computers that are not connected to each other._
- _The fifth number is an IEEE 802 node number that provides spatial uniqueness. A random number is substituted if the latter is not available (for example, because the host computer has no Ethernet card, or we do not know how to find the hardware address of an interface on your operating system). In this case, spatial uniqueness **cannot** be guaranteed. Nevertheless, a collision **should** have very low probability._
- _Although [`UUID()`](http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html#function_uuid) values are intended to be unique, they are **not** necessarily unguessable or unpredictable. If unpredictability is required, UUID values should be generated some other way._
