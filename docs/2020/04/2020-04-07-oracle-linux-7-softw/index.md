---
title: "oracle linux 7 software collections"
date: 2020-04-07
categories: 
  - "osde"
tags: 
  - "oracle-linux"
  - "software-collections"
---

oracle linux 7 software collections

- https://docs.oracle.com/en/operating-systems/oracle-linux/7/
- https://docs.oracle.com/en/operating-systems/oracle-linux/scl-user/E59096.pdf

install

```
# yum install scl-utils 
# scl list
# yum list available sw_col-\*
# yum --disablerepo="*" --enablerepo="*_SoftwareCollections" list available
```
