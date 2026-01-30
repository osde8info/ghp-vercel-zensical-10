---
title: "m$ windows 10 + wsl 2 + oracle linux 8 + firefox + zscaler errors"
date: 2023-01-04
categories: 
  - "osde"
---

using m$ windows 10 + wsl 2 + oracle linux 8 + firefox + zscaler might give you Zscaler Root CA errors such as

```
Warning: Potential Security Risk Ahead

Firefox detected a potential security threat and did not continue to www.mozilla.org. 
If you visit this site, attackers could try to steal information like your passwords, emails, or credit card details.
```

```
Software is Preventing Firefox From Safely Connecting to This Site

linux.oracle.com is most likely a safe site, but a secure connection could not be established. 
This issue is caused by Zscaler Root CA, which is either software on your computer or your network.
If you are not familiar with Zscaler Root CA, then this could be an attack and you should not continue to the site.
```

```
Firefox uses the Mozilla CA store to verify that a connection is secure, rather than certificates supplied by the user’s operating system. So, if an antivirus program or a network is intercepting a connection with a security certificate issued by a CA that is not in the Mozilla CA store, the connection is considered unsafe.
 
Error code: MOZILLA_PKIX_ERROR_MITM_DETECTED
```

```
Error code: SEC_ERROR_UNKNOWN_ISSUER
```

refs

- http://gateway.zscalerthree.net/crl/zs3-kek--4-1.crl

- http://gateway.zscalerthree.net/zscaler-zscrl--4-1.crl

shots

[![](images/image-11.png)](https://osde8info.wordpress.com/wp-content/uploads/2023/01/image-11.png)

or

[![](images/image-12.png)](https://osde8info.wordpress.com/wp-content/uploads/2023/01/image-12.png)
