---
title: "CentOS 8 has split packages into baseos and appstream repos"
date: 2020-04-07
categories: 
  - "osde"
tags: 
  - "centos"
  - "dnf"
  - "modules"
  - "repos"
  - "streams"
  - "yum"
---

CentOS 8 has split packages into baseos and appstream repos

appstream repos are further split into modules streams and module profiles

there is a new command to manage the modules

```
# dnf modules 
# dnf module enable module-name:stream
# dnf module list postgresql
```

and new install commands to install module streams and module profiles

```
# dnf install @module-name:stream/profile
```

see

- https://docs.centos.org/en-US/8-docs/managing-userspace-components/assembly\_using-appstream/
- https://docs.centos.org/en-US/8-docs/managing-userspace-components/assembly\_introduction-to-modules/
- https://docs.centos.org/en-US/8-docs/managing-userspace-components/assembly\_introduction-to-modules/#module-streams\_introduction-to-modules
- https://docs.centos.org/en-US/8-docs/managing-userspace-components/assembly\_installing-rhel-8-content/#selecting-a-stream-before-installation-of-packages\_installing-rhel-8-content
- https://docs.centos.org/en-US/8-docs/managing-userspace-components/assembly\_installing-rhel-8-content/#installing-a-package\_installing-rhel-8-content
- https://docs.centos.org/en-US/8-docs/managing-userspace-components/assembly\_installing-rhel-8-content/#selecting-a-stream-before-installation-of-packages\_installing-rhel-8-content
