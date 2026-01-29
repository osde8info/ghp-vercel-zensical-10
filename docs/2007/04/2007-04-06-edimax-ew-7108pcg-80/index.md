---
title: "EDIMAX EW-7108PCG 802.11 Wi-Fi Cardbus cards"
date: 2007-04-06
categories: 
  - "osde"
tags: 
  - "802-11"
  - "card"
  - "cardbus"
  - "driver"
  - "edimax"
  - "gnu-linux"
  - "hardware"
  - "ubuntu"
  - "wi-fi"
  - "wireless"
---

EDIMAX EW-7108PCG Wi-Fi cardbus card seems to be available in two colours ! "light red" and "dark red" !

It seems that the "light red" ones work with Ed/X/Ubuntu GnewSense GNU/Linux and "dark red" ones don't work ! To avoid confusion here are some photos of the "dark red" one : front of card, back of card and box it was in !  

  

[![P1010068](images/6a00d4141b9517685e00d4142e00333c7f.jpg)](http://osde8info.wordpress.com/wp-content/uploads/2007/04/6a00d4141b9517685e00d4142e00333c7f.jpg "P1010068")[![P1010071](images/6a00d4141b9517685e00d414278038685e.jpg)](http://osde8info.wordpress.com/wp-content/uploads/2007/04/6a00d4141b9517685e00d414278038685e.jpg "P1010071")[![P1010072](images/6a00d4141b9517685e00cd971fed674cd5.jpg)](http://osde8info.wordpress.com/wp-content/uploads/2007/04/6a00d4141b9517685e00cd971fed674cd5.jpg "P1010072")

  
The "light red" version that does work !

`    $ lspci   0000:02:00.0 Network controller: RaLink Ralink RT2500 802.11 Cardbus Reference Card (rev 01)    `

The "dark red" version that doesn't work !

`$ lspci   0000:0a:00.0 Network controller: RaLink: Unknown device 0301   `  

[Read and post comments](http://osde-info.vox.com/library/post/edimax-ew-7108pcg-wi-fi-cardbus-card-in-dark-red.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00cd971fed744cd5?_c=feed-atom-full)
