---
title: "Maybe you should wait for the next version of Ubuntu !"
date: 2007-04-30
categories: 
  - "osde"
tags: 
  - "bug"
  - "monitor"
  - "ubunutu"
  - "x"
  - "xresprobe"
---

"For Feisty, xresprobe is not included in the default installation. 

In theory, this should not be an issue for most people, however I think for people  
who don't have xresprobe installed, if they reconfigure Xorg then the new xorg.conf file  
could result in incomplete monitor detection, and thus lead to this bug. 

This could also occur if the user installed a new monitor or video card and  
re-ran \`sudo dpkg-reconfigure xserver- xorg\` without first installing xresprobe. 

It could also occur if a user upgrades from Edgy or Dapper to Feisty, and xresprobe  
gets uninstalled, and then the user reconfigures xorg. 

As I understand, this was a unique change for Feisty, and wouldn't affect Edgy or Dapper  
users since as I understand xresprobe was installed by default in those.

For gutsy we've altered things such that xresprobe is once again installed by default,  
so behavior should at least return to where it was with Edgy and Dapper. 

In at least one dupe of this bug, having xresprobe present seems to have helped. 

See bug 109908."

[Read and post comments](http://osde-info.vox.com/library/post/maybe-you-should-wait-for-the-next-version-of-ubuntu.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00d4142d7fc1685e?_c=feed-atom-full)
