---
title: "is your open desktop really open ?#opensource #freelibreopensource"
date: 2020-03-31
categories: 
  - "osde"
tags: 
  - "broadcom"
  - "desktop"
  - "docker"
  - "folding"
  - "foldingathome"
  - "gpu"
  - "hp"
  - "nvidia"
  - "open-source"
  - "proprietary"
---

is your (free libre) open desktop really (free libre) open ?

this post was prompted by todays project which was to install GNU/linux natively on a HP elitebook notebook so i can run docker and access the @nvidia GPUs in @instaserver @foldingathome containers

phase 1 - install xubuntu

issues

- NO VIDEO DRIVERS (just VGA)
- NO WIFI DRIVERS (none nothing nada)

so try a bunch of usb wifi dongles

- NONE OF THESE WORK

so lets connect notebook to our mobile via an ethernet cable (here's how)

- apt update
- apt install aptitude
- aptitude update

let try and get missing drivers

- aptitude install synaptic
- run synaptic
- enable PROPRIETARY drivers !

YAY ! NVIDIA VIDEO and BROADCOM WIFI are auto detected

so

- install the PROPRIETARY drivers

reboot

video and wifi now work

BUT NOTE I and this is the main point I NOW NO LONGER HAVE A **FREE LIBRE OPEN SOURCE** DESKTOP so I might have well left Microsoft Windows 10 running natively which is what i HAVE been doing for the last 5 years and would have kept doing if hadnt especially wanted to test docker & nvidia GPUs and @foldingathome.

So are you running an open desktop ?

If it is only semi (free libre) open why not run Windows 10 natively and run a TRUE OPEN SOURCE DESKTOP ENVIRONMENT inside Oracle VirtualBox or VMware Player ?
