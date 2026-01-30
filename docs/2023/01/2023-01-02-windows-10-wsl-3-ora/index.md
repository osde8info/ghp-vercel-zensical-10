---
title: "windows 10 + wsl 3 + oraclelinux 8 + firefox 108"
date: 2023-01-02
categories: 
  - "osde"
---

windows 10 + wsl 3 + oracle linux 8 + firefox 108

after installing firefox with

```
# dnf install firefox
```

you might get the error

```
$ firefox
Couldn't open libGL.so.1: 
libGL.so.1: cannot open shared object file: No such file or directory
Redirecting call to abort() to mozalloc_abort
```

you can fix this by

```
# dnf install gdm
```

![](images/image.png)
