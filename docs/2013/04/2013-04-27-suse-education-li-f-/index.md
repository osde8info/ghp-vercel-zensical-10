---
title: "suse education li-f-e and google chromium"
date: 2013-04-27
categories: 
  - "osde"
tags: 
  - "chrome"
  - "chromium"
  - "gnome"
  - "goog"
  - "installer"
  - "kde"
  - "suse"
---

suse education li-f-e 12.2 default chromium install seems to have problems because while suse education li-f-e uses KDE the installer installs chromium-desktop-gnome instead of chromium-desktop-kde and the gnome key manager starts using 100% cpu

solution rerun yast2 and uninstall chromium-desktop-gnome and install chromium-desktop-kde
