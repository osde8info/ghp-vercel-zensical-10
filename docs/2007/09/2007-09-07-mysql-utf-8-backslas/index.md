---
title: "MySQL UTF-8, backslashes ‘  ’ &amp; singlequotes ‘ ' ’"
date: 2007-09-07
categories: 
  - "osde"
tags: 
  - "backslash"
  - "dba"
  - "mysql"
  - "query"
  - "quote"
  - "single-quote"
  - "sql"
  - "utf-8"
---

1)    
watch out for the additional Unicode single quote characters u2018 ( ‘ ) & u2019 ( ’ )

2)  
use '\\' when inserting '' and  
use '\\\\' for looking for '' in LIKE statements !

3a)  
watch out for LIKE <> REGEXP !

3b)  
where  
 first\_name LIKE '%\\\\%' or    
 last\_name LIKE '%\\\\%' or  
 email LIKE '%\\\\%'

3c)  
where  
 first\_name REGEXP '.\*\\\\.\*' or    
 last\_name REGEXP '.\*\\\\.\*' or  
 email REGEXP '.\*\\\\.\*'

4)  
documentation

http://dev.mysql.com/doc/refman/5.0/en/string-comparison-functions.html#operator\_like

extract  
   
because MySQL uses C escape syntax in strings (for example, u2018nu2019 to represent a newline character), you must double any u2018\\u2019 that you use in LIKE strings. For example, to search for u2018nu2019, specify it as u2018\\nu2019. To search for u2018\\u2019, specify it as u2018\\\\u2019; this is because the backslashes are stripped once by the parser and again when the pattern match is made, leaving a single backslash to be matched against.

ANY FINALLY FINALLY !

(Exception: At the end of the pattern string, backslash can be specified as u2018\\u2019. At the end of the string, backslash stands for itself because there is nothing following to escape.)

[Read and post comments](http://osde-info.vox.com/library/post/mysql-utf-8-backslashes-singlequotes.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00e398a5eeb30004?_c=feed-atom-full)
