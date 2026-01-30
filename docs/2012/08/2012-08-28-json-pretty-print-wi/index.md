---
title: "json pretty print with python 3"
date: 2012-08-28
categories: 
  - "osde"
tags: 
  - "json"
  - "pretty-print"
  - "python"
---

howto pretty print json with the python 3 json module

```
$ echo '{"json": "obj"}' | python -m json.tool
{
    "json": "obj"
}
```

see

- https://docs.python.org/3/library/json.html#json-commandline
