---
title: "how to change the default #gnu/#linux command line editor from #nano using the alternatives cmd (in @ibm @redhat) and update-alternatives (in @canonical @ubuntu)"
date: 2022-01-27
categories: 
  - "osde"
---

how to change your default gnu/linux command line editor from #nano using alternatives (in redhat) and update-alternatives (in ubuntu)

- https://www.redhat.com/sysadmin/alternatives-command
- https://manpages.ubuntu.com/manpages/trusty/man8/update-alternatives.8.html

```
# update-alternatives --query editor
Name: editor
Link: /usr/bin/editor
Slaves:
 editor.1.gz /usr/share/man/man1/editor.1.gz
 editor.da.1.gz /usr/share/man/da/man1/editor.1.gz
 editor.de.1.gz /usr/share/man/de/man1/editor.1.gz
 editor.fr.1.gz /usr/share/man/fr/man1/editor.1.gz
 editor.it.1.gz /usr/share/man/it/man1/editor.1.gz
 editor.ja.1.gz /usr/share/man/ja/man1/editor.1.gz
 editor.pl.1.gz /usr/share/man/pl/man1/editor.1.gz
 editor.ru.1.gz /usr/share/man/ru/man1/editor.1.gz
Status: auto
Best: /bin/nano
Value: /bin/nano

Alternative: /bin/ed
Priority: -100
Slaves:
 editor.1.gz /usr/share/man/man1/ed.1.gz
```
