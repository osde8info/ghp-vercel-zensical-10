---
title: "linuxlite chromium browser gnome-keyring is using 50% CPU #fail"
date: 2019-02-20
categories: 
  - "osde"
tags: 
  - "chromium"
  - "gnome"
  - "gnome-keyring"
  - "linuxlite"
---

linuxlite chromium browser gnome-keyring using 50% cpu so lets try and remove it with aptitude remove gnome-keyring

```
# aptitude remove gnome-keyring
The following packages will be REMOVED:  
  gnome-keyring gnome-keyring-pkcs11{u} 
0 packages upgraded, 0 newly installed, 2 to remove and 0 not upgraded.
Need to get 0 B of archives. After unpacking 3,737 kB will be freed.
Do you want to continue? [Y/n/?] y
```

yes this breaks chrome / chromium until you fix your chromium shortcut

you need to change your linuxlite chromium shortcut launcher from

```
chromium-browser %U
```

to

```
chromium-browser --password-store=basic %U
```

if you would like the chromium browser to stop using gnome-keyring you can vote here

- https://bugs.chromium.org/p/chromium/issues/detail?id=571003

and see more goog chromium browser password bugs here

- https://bugs.chromium.org/p/chromium/issues/list?q=component:UI%3EBrowser%3EPasswords
