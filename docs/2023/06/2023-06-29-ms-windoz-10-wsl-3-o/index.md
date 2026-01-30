---
title: "ms windoz 10 + wsl 3 + oraclelinux 8 + x11 errors"
date: 2023-06-29
categories: 
  - "osde"
---

if you are running ms windoz 10 + wsl 3 + oraclelinux 8 and are trying to run x11 gui apps such as ms code/vscode 1.79.2, ms edge 114 or mozilla firefox 108 and are getting x11, libGL.so.1, mesa or swrast errors

such as

```
Couldn't open libGL.so.1: libGL.so.1: cannot open shared object file: No such file or directory

libGL error: MESA-LOADER: failed to open swrast: /usr/lib64/dri/swrast_dri.so: cannot open shared object file: No such file or directory

libGL error: failed to load driver: swrast
```

try installing gdm

- https://osde8info.wordpress.com/2023/01/02/windows-10-wsl-3-oraclelinux-8-firefox-108/

and / or try

```
# dnf install redhat-lsb-desktop

and / or 
# dnf install libEGL

and / or 
# dnf install xorg-x11-server-Xdmx

and /or 
# dnf install xorg-x11-server-Xwayland
```

which will install the mesa libraries

```
 mesa-libGL             x86_64                     22.3.0-2.el8                                 
 mesa-libGLU            x86_64                     9.0.0-15.el8                                 
 mesa-libglapi          x86_64                     22.3.0-2.el8        

 mesa-libEGL            x86_64                            
 libglvnd-egl           x86_64                                                     
```
