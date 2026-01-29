---
title: "apache htaccess file for wordpress"
date: 2007-09-04
categories: 
  - "osde"
tags: 
  - "apache"
  - "htaccess"
  - "lamp"
  - "sysadmin"
  - "wordpress"
---

apache htaccess file for wordpress from

[http://perishablepress.com/press/2006/06/14/the-htaccess-rules-for-all-wordpress-permalinks/  
](http://perishablepress.com/press/2006/06/14/the-htaccess-rules-for-all-wordpress-permalinks/)  
wordpress in same dir

```
# BEGIN WordPress<IfModule mod_rewrite.c>RewriteEngine OnRewriteBase /RewriteCond %{REQUEST_FILENAME} !-fRewriteCond %{REQUEST_FILENAME} !-dRewriteRule . /index.php [L]</IfModule># END WordPress
```

  
wordpress in sub dir

```
# BEGIN WordPress<IfModule mod_rewrite.c>RewriteEngine OnRewriteBase /foo/RewriteCond %{REQUEST_FILENAME} !-fRewriteCond %{REQUEST_FILENAME} !-dRewriteRule . /foo/index.php [L]</IfModule># END WordPress
```

[Read and post comments](http://osde-info.vox.com/library/post/apache-htaccess.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00e398a4e9f30005?_c=feed-atom-full)
