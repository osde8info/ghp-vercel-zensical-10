---
title: "howto use a bt home hub with a sky hub or virginmedia hub"
date: 2014-08-17
categories: 
  - "osde"
tags: 
  - "broadband"
  - "bt"
  - "hub"
  - "router"
  - "sky"
  - "virginmedia"
  - "wifi"
---

you can use a bt home hub 4 or 5 with a sky hub or virginmedia hub to extend your broadband wifi network coverage and or add 5G to a 2.4G only network

step 1

- login to your sky hub or virginmedia hub
- look at your dhcp range
- choose a number after or at end of range (such as 192.168.0.100)

step 2

- login to your bt home hub @ 192.168.1.254
- goto advanced settings home network
- change "Hub IP Gateway Address" to ip address chosen above (ie 192.168.0.100)
- change "DHCP Server" to disabled
- click apply
- ignore warnings
- click apply

step 3

- connect an ethernet cable from sky or virgin router to a yellow socket (NOT the WAN socket) on bt home hub

step 4

- connect to sky or virginmedia wifi network
- browse to ip address chosen above (ie 192.168.0.100)
- login to bt home hub and change 2.4G and 5G frequencys names and passwords as desired (name and password can even be set to same as your existing sky or virginmedia network provided you choose a different frequency)

step 5

- enjoy extended 2.4G and additional 5G coverage around your home

thanks to

- http://www.expertreviews.co.uk/networking/1305838/how-to-use-the-bt-home-hub-5-with-another-isp
