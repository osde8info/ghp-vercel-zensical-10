---
title: "flickr api using NING"
date: 2007-08-25
categories: 
  - "osde"
tags: 
  - "api"
  - "flickr"
  - "ning"
---

[http://documentation.ning.com/](http://documentation.ning.com/)

`   include 'XNC/Services/Flickr.php';   include XN_DIR_PRIVATE . '/' .'flickr.php' ;`

`$viewer = XN_Profile::current();   $name = $viewer->isLoggedIn() ? $viewer->screenName : 'UNKNOWN' ;   $app = XN_Application::load();   $editFileUrl = 'http://'.XN_AtomHelper::HOST_APP('www').'/?view=apps&amp;op=edit&amp;appUrl='.$app->relativeUrl;`

`$flickr = new XNC_Services_Flickr($flickr);`

`$results = $flickr->tagSearch('osde.info');`

`$n = $results->totalResultsReturned;   print "";   for($i = 0; $i < (int) $n / 5; $i++) {       print "";       for($j = 0 ; $j < 5; $j++) {           $p = $results->Result[$i * ((int) $n / 5) + $j];           if ($p) {               print "";           } else {               print "";           }       }       print "";   }   print "  | Square->ClickUrl}"> |  | | --- | --- |  ";`

  

[Read and post comments](http://osde-info.vox.com/library/post/flickr-api-using-ning.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00e398a1334c0003?_c=feed-atom-full)
