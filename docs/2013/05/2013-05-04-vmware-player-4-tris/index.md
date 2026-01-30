---
title: "vmware player 4, trisquel 6 and vmware tools"
date: 2013-05-04
categories: 
  - "osde"
tags: 
  - "trisquel"
  - "vmware"
  - "vmware-tools"
  - "vmxnet"
---

i am running vmware player 4 host with trisquel 6 guest but vmware tools vmxnet will not compile

before i aptitude install installed

- build-essentials
- linux-headers
- linux-headers-generic-pae
- linux-source

i was getting

```
Searching for GCC...
Detected GCC binary at "/usr/bin/gcc".
The path "/usr/bin/gcc" appears to be a valid path to the gcc binary.
Would you like to change it? [no]
Searching for a valid kernel header path...
The path "" is not a valid path to the 3.2.0-40-generic-pae kernel headers.
Would you like to change it? [yes]
```

but now vmware tools vmxnet wont compile

```
Using 2.6.x kernel build system.
make: Entering directory `/tmp/vmware-root/modules/vmxnet-only'
make -C /lib/modules/3.2.0-40-generic/build/include/.. SUBDIRS=$PWD SRCROOT=$PWD/. \
	  MODULEBUILDDIR= modules
make[1]: Entering directory `/usr/src/linux-headers-3.2.0-40-generic'
  CC [M]  /tmp/vmware-root/modules/vmxnet-only/vmxnet.o
/tmp/vmware-root/modules/vmxnet-only/vmxnet.c: In function ‘vmxnet_probe_device’:
/tmp/vmware-root/modules/vmxnet-only/vmxnet.c:1008:7: error: unknown field ‘ndo_set_multicast_list’ specified in initialiser
/tmp/vmware-root/modules/vmxnet-only/vmxnet.c:1008:7: warning: initialisation from incompatible pointer type [enabled by default]
/tmp/vmware-root/modules/vmxnet-only/vmxnet.c:1008:7: warning: (near initialisation for ‘vmxnet_netdev_ops.ndo_vlan_rx_add_vid’) [enabled by default]
/tmp/vmware-root/modules/vmxnet-only/vmxnet.c: In function ‘vmxnet_map_pkt’:
/tmp/vmware-root/modules/vmxnet-only/vmxnet.c:2085:32: error: incompatible type for argument 2 of ‘pci_map_page’
include/asm-generic/pci-dma-compat.h:43:1: note: expected ‘struct page *’ but argument is of type ‘struct ’
/tmp/vmware-root/modules/vmxnet-only/vmxnet.c:2104:26: error: incompatible type for argument 2 of ‘pci_map_page’
include/asm-generic/pci-dma-compat.h:43:1: note: expected ‘struct page *’ but argument is of type ‘struct ’
/tmp/vmware-root/modules/vmxnet-only/vmxnet.c: In function ‘vmxnet_rx_frags’:
/tmp/vmware-root/modules/vmxnet-only/vmxnet.c:2599:48: error: incompatible types when assigning to type ‘struct ’ from type ‘struct page *’
make[2]: *** [/tmp/vmware-root/modules/vmxnet-only/vmxnet.o] Error 1
make[1]: *** [_module_/tmp/vmware-root/modules/vmxnet-only] Error 2
make[1]: Leaving directory `/usr/src/linux-headers-3.2.0-40-generic'
make: *** [vmxnet.ko] Error 2
make: Leaving directory `/tmp/vmware-root/modules/vmxnet-only'
```
