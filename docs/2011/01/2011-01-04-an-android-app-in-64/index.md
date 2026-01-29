---
title: "an android app in 64 lines of code"
date: 2011-01-04
categories: 
  - "osde"
tags: 
  - "android"
  - "mobdev"
  - "mobile"
  - "open-source"
---

an android app in 64 lines of code thanks to the power of vmware player, ubuntu, java, android sdk and [appcelerator titanium](http://www.appcelerator.com/products/titanium-mobile-application-development/ "appcelerator")

[![appcelerator titanium android app](images/5324008397_2604e9f160_m.jpg)](http://www.flickr.com/photos/osde-info/5324008397/ "appcelerator titanium android app by osde8info, on Flickr")

```
$ cat app.js
// this sets the background color of the master UIView (when there are no windows/tab groups on it)
Titanium.UI.setBackgroundColor('#000');

// create tab group
var tabGroup = Titanium.UI.createTabGroup();

//
// create base UI tab and root window
//
var win1 = Titanium.UI.createWindow({
    title:'Tab 1',
    backgroundColor:'#fff'
});
var tab1 = Titanium.UI.createTab({
    icon:'KS_nav_views.png',
    title:'Tab 1',
    window:win1
});

var label1 = Titanium.UI.createLabel({
	color:'#999',
	text:'I am Window 1',
	font:{fontSize:20,fontFamily:'Helvetica Neue'},
	textAlign:'center',
	width:'auto'
});

win1.add(label1);

//
// create controls tab and root window
//
var win2 = Titanium.UI.createWindow({
    title:'Tab 2',
    backgroundColor:'#fff'
});
var tab2 = Titanium.UI.createTab({
    icon:'KS_nav_ui.png',
    title:'Tab 2',
    window:win2
});

var label2 = Titanium.UI.createLabel({
	color:'#999',
	text:'I am Window 2',
	font:{fontSize:20,fontFamily:'Helvetica Neue'},
	textAlign:'center',
	width:'auto'
});

win2.add(label2);

//
//  add tabs
//
tabGroup.addTab(tab1);
tabGroup.addTab(tab2);  

// open tab group
tabGroup.open();
```
