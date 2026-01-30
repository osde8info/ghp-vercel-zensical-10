---
title: "ubuntu alternatives"
date: 2014-12-19
categories: 
  - "osde"
tags: 
  - "app"
  - "defaults"
  - "favorites"
  - "ubuntu"
---

as well as the select-editor command ubuntu update-alternatives lets you make your favorite browser, texteditor etc your default

- http://linux.die.net/man/8/update-alternatives

find out what your default apps are currently with

```
$ su -
# update-alternatives --get-selections
```

use update-alternatives --config to interactively change a single alt

```
$ su -
# update-alternatives --config x-terminal-emulator
```

or if you have a lot of spare time you can set ALL your favorite default apps

```
$ su -
# update-alternatives -all
```
