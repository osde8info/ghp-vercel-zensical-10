---
title: "xubuntu 10, 11, 12 &amp; 13 alt print screen problems"
date: 2013-04-12
categories: 
  - "osde"
tags: 
  - "printscreen"
  - "xfce"
  - "xubuntu"
---

in ubuntu & xubuntu 10, 11, 12 & 13 (especially in a vmware player vm) you may have problems with alt print screen not printing the current window and according to some of the comments in the "official" bug report https://bugs.launchpad.net/ubuntu/+source/metacity/+bug/642792 it isnt a bug in ubuntu but it is actually a bug in windoz that it does work

one way of fixing is to create your own keyboard shortcut as follows

click

- xfce | settings manager | other | settings editor | xfce4-keyboard-shortcuts

then add your own | new | keyboard shortcut

- /commands/custom/<Super>Print

that executes

- xfce4-screenshooter -w

which will make Windoz-PrintScreen work instead of Alt-PrintScreen

[![xubuntu xfce alt print screen](images/8642955328_4668ca66ff_n.jpg)](http://www.flickr.com/photos/osde-info/8642955328/ "xubuntu xfce alt print screen by osde8info, on Flickr") also many thanks to

- http://askubuntu.com/questions/226117/screenshot-of-active-window
- http://superuser.com/questions/258735/ubuntu-10-10-screenshot-of-active-window-doesnt-work
- http://ubuntuguide.net/fix-altprint-screen-current-window-screenshot-not-working-in-ubuntu-10-10
- http://xubuntugeek.blogspot.co.uk/2012/06/fix-current-window-screenshot-altprint.html
