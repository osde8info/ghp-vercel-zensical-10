---
title: "immutable gnu/linux desktop distros"
date: 2023-05-25
categories: 
  - "osde"
---

fedora (kinote, onyx, serica, silverblue)

- https://docs.fedoraproject.org/en-US/fedora-kinoite/

- https://www.gamingonlinux.com/2023/05/fedora-onyx-voted-in-as-a-new-official-fedora-linux-immutable-variant/

- https://www.fedoraproject.org/sericea/

- https://www.fedoraproject.org/silverblue/

nixos

- nixos

vanilla

- vanillaos

NOTES

_With Fedora Kinoite, only certain mounts can be manually specified as partitions._

These include:

- `/boot`

- `/var`
    - Subdirectories under `/var`, including:
        - `/var/home` (Fedora Kinoite has a symlink from `/home` to `/var/home`)
        
        - `/var/log`
        
        - `/var/containers`
    
    - The root filesystem: `/`

_The Fedora installer is not aware of these restrictions and will accept custom partitions without error, even if they are incompatible with Fedora Kinoite._

[![](images/virtualbox_kino_26_05_2023_10_06_29.png)](https://osde8info.wordpress.com/wp-content/uploads/2023/05/virtualbox_kino_26_05_2023_10_06_29.png)
