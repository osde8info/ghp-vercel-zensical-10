---
title: "phoronix test suite howto"
date: 2011-02-08
categories: 
  - "osde"
tags: 
  - "floss"
  - "sysadmin"
  - "ubuntu"
---

PRE-REQUISITES

The following dependencies are needed

\- gcc - gcc-c++ - make - autoconf - automake

```
so
# aptitude install autoconf automake gcc gcc-C++ make tcl unzip
or
# yum install autoconf automake gcc gcc-C++ make tcl unzip
```

### RUN PHORONIX BENCHMARKS

```
$ wget http://www.phoronix-test-suite.com\
/download.php?file=phoronix-test-suite-2.8.2

$ tar zxvf phoronix-test-suite-2.8.2.tar.gz
$ cd phoronix-test-suite
```

```
$ ./phoronix-test-suite login
$ ./phoronix-test-suite benchmark byte
$ ./phoronix-test-suite benchmark crafty
$ ./phoronix-test-suite benchmark sudokut
```

RESULTS

- [http://global.phoronix-test-suite.com/index.php?k=author&u=osde8info](http://global.phoronix-test-suite.com/index.php?k=author&u=osde8info)
- http://global.phoronix-test-suite.com/index.php?k=profile&u=osde8info-22051-23006-18451
- http://global.phoronix-test-suite.com/index.php?k=profile&u=osde8info-13550-13559-11969
