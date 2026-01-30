---
title: "GNU/Linux Qualcomm Atheros AR242x AR542x ath5k wireless driver issues"
date: 2017-09-08
categories: 
  - "osde"
---

GNU/Linux Qualcomm Atheros ath5k wireless driver is now working but has some issues

Hardware Spec

- HP Compaq Presario CQ61
- Qualcomm Atheros AR242x / AR542x Wireless Network Adapter

WiFi ON/OFF button now enables and disables WiFi but LED(s) behaves differently to the way it does in windows.

With opensuse gnu/linux and the ath5k driver the LED remains orange when wifi is either on or off but flickers blue when there is some network traffic as opposed to windoz where it is always orange when wifi is off and always blue when wifi is on.

See also

- https://bugs.launchpad.net/ubuntu/+source/linux-firmware/+bug/1520343
- https://www.topbug.net/blog/2015/01/13/control-the-led-on-a-usb-wifi-adapter-on-linux/

```
# lshw -c network
  *-network                 
       description: Wireless interface
       product: AR242x / AR542x Wireless Network Adapter (PCI-Express)
       vendor: Qualcomm Atheros
       physical id: 0
       bus info: pci@0000:02:00.0
       logical name: wlan0
       version: 01
       serial: 00:24:2b:cb:ac:99
       width: 64 bits
       clock: 33MHz
       capabilities: pm msi pciexpress msix bus_master cap_list ethernet physical wireless
       configuration: broadcast=yes driver=ath5k driverversion=4.4.85-22-default firmware=N/A ip=192.168.0.66 latency=0 link=yes multicast=yes wireless=IEEE 802.11bg
       resources: irq:16 memory:d3500000-d350ffff

```
