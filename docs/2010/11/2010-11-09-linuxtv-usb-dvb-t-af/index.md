---
title: "linuxtv usb dvb-t afatech problems"
date: 2010-11-09
categories: 
  - "osde"
tags: 
  - "dvb"
  - "gnu-linux"
---

it turns out that its not enough to have a usb dvb-t stick with the af9015 chipset

ID 15a4:9016 Afatech Technologies, Inc. AF9015 DVB-T USB2.0 stick

because

af9015: tuner NXP TDA18218 not supported yet usbcore: registered new interface driver dvb\_usb\_af9015
