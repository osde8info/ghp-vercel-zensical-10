---
title: "linuxlite xubuntu kannanda font install"
date: 2018-03-01
categories: 
  - "osde"
tags: 
  - "font"
  - "kannanda"
  - "linuxlite"
  - "xubuntu"
---

linuxliteos (and ed/x/ubuntu) if you are using a site that uses the kannanda font (such as https://www.news18.com/world/) you will need to install the package language-pack-kn but first close any browsers first and reopen them after installing in case your pc crashes during the update

```
# aptitude show language-pack-kn
```

 

which should auto install the following dependancies

```
# apt-cache rdepends language-pack-kn
language-pack-kn
Reverse Depends:
 language-pack-gnome-kn
 language-pack-kn-base
 language-pack-kn-base
 language-pack-kn-base
 language-pack-kn
 language-pack-gnome-kn-base
 language-pack-gnome-kn
 language-pack-gnome-kn
 language-pack-kn-base
 language-pack-kn-base
 language-pack-kn-base
 language-pack-kn
 language-pack-gnome-kn-base
 language-pack-gnome-kn
```
