---
title: "Ubuntu 6.06 and 7.04 are now both broken !"
date: 2007-05-26
categories: 
  - "osde"
tags: 
  - "6-06"
  - "7-04"
  - "gnewsense"
  - "gnu-linux"
  - "red-hat"
  - "ubuntu"
---

**Ubuntu 6.06**  
breaks after running update manager !

and  
**  
Ubuntu 7.04**  
is broken from the beginning!  

- cannot install on 800x600 screen
- disk partitioner refuses to overwrite debian partition
- WiFi is broken (duplicate adapters and neither works)
- USB mouse becomes dead paperweight after just three minutes
- VMware Server 1.0.3 does not install (even if you download all of the dozens of fixs and patches available on the web)

I'm going to switch to [gNewSense](http://www.gnewsense.org/Main/Features) or might even pay Red Hat the £40 they are asking for Red Hat Desktop Linux 5 !

**Ubuntu 6.06**

`It is impossible to install or remove any software.   Please use the package manager "Synaptic" or run "sudo apt-get install -f" in a terminal to fix this issue at first.   `

Does this help ?

`    # apt-get install -f   Reading package lists... Done   Building dependency tree... Done   Correcting dependencies... Done   The following extra packages will be installed:     samba   Recommended packages:     smbldap-tools   The following packages will be upgraded:     samba   1 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.   Need to get 0B/2849kB of archives.   After unpacking 8192B of additional disk space will be used.   Do you want to continue [Y/n]?   Preconfiguring packages ...   (Reading database ... 99900 files and directories currently installed.)   Preparing to replace samba 3.0.22-1ubuntu3.2 (using .../samba_3.0.22-1ubuntu 3.3_i386.deb) ...   invoke-rc.d: dangling symlink: /etc/rc2.d/S91samba   dpkg: warning - old pre-removal script returned error exit status 102   dpkg - trying script from the new package instead ...   invoke-rc.d: dangling symlink: /etc/rc2.d/S91samba   dpkg: error processing /var/cache/apt/archives/samba_3.0.22-1ubuntu3.3_i386. deb (--unpack):    subprocess new pre-removal script returned error exit status 102   Errors were encountered while processing:    /var/cache/apt/archives/samba_3.0.22-1ubuntu3.3_i386.deb   E: Sub-process /usr/bin/dpkg returned an error code (1)    `

No it doesn't !

**Ubuntu 7.04**  
`# lsusb   Bus 003 Device 001: ID 0000:0000    Bus 002 Device 002: ID 045e:0053 Microsoft Corp.   Bus 002 Device 001: ID 0000:0000    Bus 001 Device 001: ID 0000:0000    $ lspci   00:00.0 Host bridge: ATI Technologies Inc Unknown device 5a31 (rev 01)   00:01.0 PCI bridge: ATI Technologies Inc RS480 PCI Bridge   00:13.0 USB Controller: ATI Technologies Inc IXP SB400 USB Host Controller (rev 80)   00:13.1 USB Controller: ATI Technologies Inc IXP SB400 USB Host Controller (rev 80)   00:13.2 USB Controller: ATI Technologies Inc IXP SB400 USB2 Host Controller (rev 80)   00:14.0 SMBus: ATI Technologies Inc IXP SB400 SMBus Controller (rev 81)   00:14.1 IDE interface: ATI Technologies Inc Standard Dual Channel PCI IDE Controller ATI (rev 80)   00:14.3 ISA bridge: ATI Technologies Inc IXP SB400 PCI-ISA Bridge (rev 80)   00:14.4 PCI bridge: ATI Technologies Inc IXP SB400 PCI-PCI Bridge (rev 80)   00:14.5 Multimedia audio controller: ATI Technologies Inc IXP SB400 AC'97 Audio Controller (rev 80)   00:14.6 Modem: ATI Technologies Inc ATI SB400 - AC'97 Modem Controller (rev 80)   01:05.0 VGA compatible controller: ATI Technologies Inc RC410 [Radeon Xpress 200M]   09:01.0 CardBus bridge: Texas Instruments PCI1510 PC card Cardbus Controller   09:02.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL-8139/8139C/8139C+ (rev 10)   09:04.0 Ethernet controller: Atheros Communications, Inc. AR5005G 802.11abg NIC (rev 01)   `

  

[Read and post comments](http://osde-info.vox.com/library/post/ubuntu-606-and-704-are-now-both-broken.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00d4143b721e3c7f?_c=feed-atom-full)
