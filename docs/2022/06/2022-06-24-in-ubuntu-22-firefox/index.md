---
title: "in @ubuntu 22 @firefox no longer auto updates because it is a #snap"
date: 2022-06-24
categories: 
  - "osde"
---

in @ubuntu 22 @firefox no longer auto updates because it is a #snap

`# aptitude safe-upgrade`

because it is now a snap so you need to run snap refresh after safe-upgrade

```
# snap list
Name               Version          Rev    Tracking         Publisher   Notes
bare               1.0              5      latest/stable    canonical✓  base
core20             20220527         1518   latest/stable    canonical✓  base
firefox            99.0.1-1         1232   latest/stable/…  mozilla✓    -

# snap refresh

# snap list
Name               Version          Rev    Tracking         Publisher   Notes
bare               1.0              5      latest/stable    canonical✓  base
core20             20220527         1518   latest/stable    canonical✓  base
firefox            101.0.1-1        1443   latest/stable/…  mozilla✓    -
```
