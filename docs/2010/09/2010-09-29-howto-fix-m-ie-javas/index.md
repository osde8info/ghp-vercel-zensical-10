---
title: "howto fix m$ ie javascript timeouts"
date: 2010-09-29
categories: 
  - "osde"
tags: 
  - "webdev"
---

M$ IE may time out when running javascript and display the error:

"A script on this page is causing Internet Explorer to run slowly"

You may be able to fix this by:

- running regedit
- adding a key HKEY\_CURRENT\_USER\\Software\\Microsoft\\Internet Explorer\\Styles
- adding a keyvalue MaxScriptStatements DWORD with a value 50,000,000

M$ IE (6,7,8) should now wait 10 x longer than the default timeout of 5,000,000 script lines !

See also

- [http://support.microsoft.com/kb/175500](http://support.microsoft.com/kb/175500)
- [](http://support.microsoft.com/kb/175500)[http://social.answers.microsoft.com/Search/en-gb/?query=175500](http://social.answers.microsoft.com/Search/en-gb/?query=175500)
