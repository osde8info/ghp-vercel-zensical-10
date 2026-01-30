---
title: "raspberry pi activity led"
date: 2013-04-05
categories: 
  - "osde"
tags: 
  - "gpio"
  - "led"
  - "raspberry-pi"
---

http://www.vanheusden.com/misc/rpi.php

you can turn the raspberry pi green activity led on for one second by

```
$ sudo -i
# cd /sys/bus/platform/devices/leds-gpio/leds/led0/
# echo 1 > brightness
```
