---
title: "howto update tails"
date: 2019-05-25
categories: 
  - "osde"
tags: 
  - "aptitude"
  - "tails"
  - "update"
---

howto update tails

- enable persistance
- install aptitude
- say YES to persist on reboot

then everytime you reboot

- enable persistance
- run aptitude

sample output

```
# aptitude update
# aptitude safe-upgrade
The following packages will be upgraded: 
  libavcodec57 libavfilter6 libavformat57 libavresample3 libavutil55 libpostproc54 libswresample2 
  libswscale4 linux-image-4.19.0-5-amd64 wpasupplicant 
10 packages upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
Need to get 55.5 MB of archives. After unpacking 28.7 kB will be used.
Do you want to continue? [Y/n/?] 
Get: 1 tor+http://sgvtcaew4bxjd7ln.onion stretch/updates/main amd64 libavutil55 amd64 7:3.2.14-1~deb9u1 [221 kB]
Get: 2 tor+http://vwakviie2ienjx6t.onion/debian sid/main amd64 linux-image-4.19.0-5-amd64 amd64 4.19.37-3 [47.6 MB]
Get: 3 tor+http://sgvtcaew4bxjd7ln.onion stretch/updates/main amd64 libswresample2 amd64 7:3.2.14-1~deb9u1 [101 kB]
Get: 4 tor+http://sgvtcaew4bxjd7ln.onion stretch/updates/main amd64 libavcodec57 amd64 7:3.2.14-1~deb9u1 [4454 kB]
Get: 5 tor+http://sgvtcaew4bxjd7ln.onion stretch/updates/main amd64 libavformat57 amd64 7:3.2.14-1~deb9u1 [943 kB] 
Get: 6 tor+http://sgvtcaew4bxjd7ln.onion stretch/updates/main amd64 libavresample3 amd64 7:3.2.14-1~deb9u1 [98.1 kB]
Get: 7 tor+http://sgvtcaew4bxjd7ln.onion stretch/updates/main amd64 libpostproc54 amd64 7:3.2.14-1~deb9u1 [98.1 kB]
Get: 8 tor+http://sgvtcaew4bxjd7ln.onion stretch/updates/main amd64 libswscale4 amd64 7:3.2.14-1~deb9u1 [196 kB]   
Get: 9 tor+http://sgvtcaew4bxjd7ln.onion stretch/updates/main amd64 libavfilter6 amd64 7:3.2.14-1~deb9u1 [813 kB]  
Get: 10 tor+http://sgvtcaew4bxjd7ln.onion stretch/updates/main amd64 wpasupplicant amd64 2:2.4-1+deb9u4 [974 kB] 

```
