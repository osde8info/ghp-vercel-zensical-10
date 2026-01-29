---
title: "flickr API using phpflickr class"
date: 2007-06-17
categories: 
  - "osde"
tags: 
  - "api"
  - "bbc"
  - "code"
  - "example"
  - "flickr"
  - "hackday"
  - "webservice"
  - "yahoo"
---

Flickr API using [phpflickr](http://phpflickr.com/) class

`   /* flickr api using phpflickr class */`

`include 'flickrconsts.php' ;   include 'phpFlickr.php' ;`

`$f = new phpFlickr( FLK_API_KEY, FLK_SECRET, false );`

```
$url = $f -> urls_getUserPhotos('8764442@N07') ;echo $f -> getErrorCode() . $f ->getErrorMsg() ;echo $url ;$url = $f -> people_getPublicPhotos('8764442@N07','geo,tags,machine_tags', 5) ;echo $f -> getErrorCode() . $f ->getErrorMsg() ;print_r( $url ) ;
```

[Read and post comments](http://osde-info.vox.com/library/post/flickr-api-using-phpflickr-class.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00d414425e476a47?_c=feed-atom-full)
