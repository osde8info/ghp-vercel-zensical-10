---
title: "OVH Cloud VMs HyperVisor"
date: 2011-04-23
categories: 
  - "osde"
tags: 
  - "clouds-and-grids"
  - "ovh"
  - "sysadmin"
  - "virtualisation"
---

Which HyperVisor do [OVH VPS Cloud VM](http://www.ovh.co.uk/vps/ "ovh vps")s use ? KVM, VMware or Xen ?

I dont know ! But the output of LSPCI suggests its VMware (Server) !

```
# lspci
00:00.0 Host bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX Host bridge (rev 01)
00:01.0 PCI bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX AGP bridge (rev 01)
00:07.0 ISA bridge: Intel Corporation 82371AB/EB/MB PIIX4 ISA (rev 08)
00:07.1 IDE interface: Intel Corporation 82371AB/EB/MB PIIX4 IDE (rev 01)
00:07.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 08)
00:07.7 System peripheral: VMware Virtual Machine Communication Interface (rev 10)
00:0f.0 VGA compatible controller: VMware SVGA II Adapter
00:10.0 SCSI storage controller: LSI Logic / Symbios Logic 53c1030 PCI-X Fusion-MPT Dual Ultra320 SCSI (rev 01)
00:11.0 PCI bridge: VMware PCI bridge (rev 02)
00:15.0 PCI bridge: VMware PCI Express Root Port (rev 01)
...
00:18.7 PCI bridge: VMware PCI Express Root Port (rev 01)
02:00.0 Ethernet controller: Intel Corporation 82545EM Gigabit Ethernet Controller (Copper) (rev 01)
```
