---
title: "virtualisation and amd and intel speculative execution security bugs"
date: 2018-02-17
categories: 
  - "osde"
tags: 
  - "microcode"
  - "virtualisation"
  - "vmware"
---

virtualisation and amd and intel speculative execution security bugs

if you want to use amd and intel microcode updates that mitigate against "branch target injection" (aka meltdown and spectre) defects in their CPUs you may want to patch your host and enable hypervisor-assisted guest mitigation so virtual machine guests also function

https://www.vmware.com/us/security/advisories/VMSA-2018-0004.html

- Hypervisor-Specific Mitigation
- Hypervisor-Assisted Guest Mitigation
- Operating System-Specific Mitigations

See also

- https://kb.vmware.com/s/article/52085
- https://kb.vmware.com/s/article/52245
