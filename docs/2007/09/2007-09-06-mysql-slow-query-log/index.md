---
title: "MySQL slow query log and mysqldumpslow"
date: 2007-09-06
categories: 
  - "osde"
tags: 
  - "dba"
  - "mysql"
  - "sysadmin"
---

First enable slow query logging, then generate a slow query and finally look at the slow query log !

**Enable**  
[http://dev.mysql.com/doc/refman/5.0/en/slow-query-log.html](http://dev.mysql.com/doc/refman/5.0/en/slow-query-log.html)

**Generate**  
`    select sleep(2)    `

**then run mysqldumpslow**  
`   $ mysqldumpslow --help   Usage: mysqldumpslow [ OPTS... ] [ LOGS... ]`

`Parse and summarize the MySQL slow query log. Options are`

  `--verbose    verbose     --debug      debug     --help       write this text to standard output`

  `-v           verbose     -d           debug     -s ORDER     what to sort by (t, at, l, al, r, ar etc), 'at' is default     -r           reverse the sort order (largest last instead of first)     -t NUM       just show the top n queries     -a           don't abstract all numbers to N and strings to 'S'     -n NUM       abstract numbers with at least n digits within names     -g PATTERN   grep: only consider stmts that include this string     -h HOSTNAME  hostname of db server for *-slow.log filename (can be wildcard),                  default is '*', i.e. match all     -i NAME      name of server instance (if using mysql.server startup script)     -l           don't subtract lock time from total time`

**mysqldumpslow output**  
`    # Time: 070906 12:47:20   # User@Host: root[root] @ localhost []   # Query_time: 3  Lock_time: 0  Rows_sent: 1  Rows_examined: 0   select sleep(3);    `  

[Read and post comments](http://osde-info.vox.com/library/post/mysql-slow-query-log-and-mysqldumpslow.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00e398a584990004?_c=feed-atom-full)
