---
title: "Panoramio Geo Tagged Photo API"
date: 2008-03-28
categories: 
  - "osde"
tags: 
  - "api"
  - "geo-tag"
  - "google"
  - "json"
  - "map"
  - "photos"
  - "rest"
  - "web-3-0"
  - "web-services"
---

Learn about the Web Services standards REST and JSON by using Google Panoramio and just your web browser !

_Using the Google [Panoramio API](http://www.panoramio.com/api/) you can display the photos from Panoramio on your own web site. Geolocated photos from Panoramio are great to enrich your maps or illustrate information where location is a important factor (real estate sites, hotels and vacation sites, routes & trails...).  
_  
Here's how you'd get some photos of London (X=~0,Y=~51)

```

```

  

```
http://www.panoramio.com/photo/8075745
```

  
[http://www.panoramio.com/map/get\_panoramas.php ? from=1 & to=16 & minx=-1 & miny=50 & maxx=1 & maxy=52 & size=small](http://www.panoramio.com/map/get_panoramas.php?&from=1&to=16&minx=-1&miny=50&maxx=1&maxy=52&size=small) (just remove the spaces on either side of each "?" and "&" )

  
This REST call returns a JSON result set that you can view in your browser and cut and paste photo URLs from :

{"count": 42259,  
 "photos":  
 \[  
 { "photo\_id": 4337937, "photo\_title": "Sir Tatton Sykes Monument", "photo\_url": "[http://www.panoramio.com/photo/4337937](http://www.panoramio.com/photo/4337937)", "photo\_file\_url": "http://mw2.google.com/mw- panoramio/photos/medium/4337937.jpg", "longitude": -0.537515, "latitude": 54.042054, "width": 270, "height": 500, "upload\_date": "31 August 2007", "owner\_id": 278681, "owner\_name":  "G3ZZP", "owner\_url": "[http://www.panoramio.com/user/278681](http://www.panoramio.com/user/278681)" }  
,  
 { "photo\_id": 51502, "photo\_title": "eclipse", "photo\_url": "[http://www.panoramio.com/photo/51502](http://www.panoramio.com/photo/51502)", "photo\_file\_url": "http://mw2.google.com/mw-panoramio/photos/medium/51502.jpg",  "longitude": -0.121665, "latitude": 51.500969, "width": 500, "height": 375, "upload\_date": "24 September 2006", "owner\_id": 6645, "owner\_name": "JesusVillalba", "owner\_url":  "[http://www.panoramio.com/user/6645](http://www.panoramio.com/user/6645)" }  
 \]  
}

  
For more help see [http://www.panoramio.com/help/](http://www.panoramio.com/help/)  

[Read and post comments](http://osde-info.vox.com/library/post/panoramio.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00f48d07b5ef0001?_c=feed-atom-full)
