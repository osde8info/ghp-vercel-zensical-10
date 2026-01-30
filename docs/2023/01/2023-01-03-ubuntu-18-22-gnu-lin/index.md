---
title: "m$ windows 10 + wsl 2 + ubuntu 18/22 + m$ edge (stable / dev / beta)"
date: 2023-01-03
categories: 
  - "osde"
---

m$ windows 10 + wsl 2 + ubuntu 18 & 22 gnu/linux m$ edge (stable / dev / beta) install with apt &| dpkg &| aptitude but beware zscaler errors

- https://www.microsoftedgeinsider.com/en-us/download/?platform=linux

install microsoft keyring and microsoft repo using gpg and install

```
# curl https://packages.microsoft.com/keys/microsoft.asc \ 
| gpg --dearmor > microsoft.gpg

# install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/

# echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" \ 
> /etc/apt/sources.list.d/microsoft-edge.list

# cat /etc/apt/sources.list.d/microsoft-edge.list
deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main

# rm microsoft.gpg
```

install

```
# aptitude update

aptitude search microsoft-edge
p   microsoft-edge-beta    - The web browser from Microsoft
p   microsoft-edge-dev     - The web browser from Microsoft
p   microsoft-edge-stable  - The web browser from Microsoft
```

choose stable dev or beta

```
# aptitude install microsoft-edge-stable
The following NEW packages will be installed:
  cpp{a} cpp-7{a} fonts-liberation{a} gcc-7-base{a} libatomic1{a} libauthen-sasl-perl{a} libdata-dump-perl{a} libfile-basedir-perl{a}
  libfile-desktopentry-perl{a} libfile-listing-perl{a} libfile-mimeinfo-perl{a} libfont-afm-perl{a} libgbm1{a} libhtml-form-perl{a}
  libhtml-format-perl{a} libhtml-tree-perl{a} libhttp-cookies-perl{a} libhttp-daemon-perl{a} libhttp-negotiate-perl{a} libio-socket-ssl-perl{a}
  libipc-system-simple-perl{a} libisl19{a} liblwp-protocol-https-perl{a} libmailtools-perl{a} libmpc3{a} libnet-dbus-perl{a} libnet-http-perl{a}
  libnet-smtp-ssl-perl{a} libnet-ssleay-perl{a} libnspr4{a} libnss3{a} libsecret-1-0{a} libsecret-common{a} libtie-ixhash-perl{a} libtry-tiny-perl{a}
  libu2f-udev{a} libvulkan1{a} libwayland-server0{a} libwww-perl{a} libwww-robotrules-perl{a} libx11-protocol-perl{a} libxml-parser-perl{a}
  libxml-twig-perl{a} libxml-xpathengine-perl{a} microsoft-edge-stable perl-openssl-defaults{a} x11-xserver-utils{a} xdg-utils{a}
0 packages upgraded, 48 newly installed, 0 to remove and 0 not upgraded.
Need to get 152 MB of archives. After unpacking 530 MB will be used.
Do you want to continue? [Y/n/?]
```

[![](images/image-7.png)](https://osde8info.wordpress.com/wp-content/uploads/2023/01/image-7.png)

[![](images/image-8.png)](https://osde8info.wordpress.com/wp-content/uploads/2023/01/image-8.png)

however you might then get zscaler errors if you are using zscaler

```
An application is preventing Microsoft Edge from safely connecting to this site

"Zscaler" wasn’t installed properly on your computer or the network:

Try uninstalling or turning off "Zscaler"
Try connecting to another network

NET::ERR_CERT_AUTHORITY_INVALID
```

[![](images/image-9.png)](https://osde8info.wordpress.com/wp-content/uploads/2023/01/image-9.png)

to bypass zscaler you can try to add an extra ip address to your network card

```
 ip addr add 192.168.0.99/24 dev eth0
```

[![](images/image-10.png)](https://osde8info.wordpress.com/wp-content/uploads/2023/01/image-10.png)
