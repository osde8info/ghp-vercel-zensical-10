---
title: "Ning widget-configuration.xml and main.php"
date: 2007-08-31
categories: 
  - "osde"
tags: 
  - "ning"
  - "php"
  - "xml"
---

## widget-configuration.xml

  
<?xml version="1.0"?>  
<widget id="123" root="aboutme">  
 <name>aboutme</name>  
    <config>  
        <version type="string" checkState="true">0.1</version>  
        <title>aboutme</title>  
        <displayName>aboutme</displayName>  
        <description>A discussion board in which people can post topics and replies.</description>  
        <isMozzle type="number">1</isMozzle>  
        <isFirstOrderFeature type="number">1</isFirstOrderFeature>  
        <isPermanent type="number">0</isPermanent>  
        <isEnabledDefault type="number">1</isEnabledDefault>  
    </config>  
    <privateConfig>  
        <isEnabled/>  
    </privateConfig>  
</widget>

## main.php

<?php xg\_header(W\_Cache::current('W\_Widget')->dir, $title = xg\_text('PHOTOS')); ?>  
<div id="xg\_body">  
 <div class="xg\_colgroup">  
        <div class="xg\_3col first-child">  
        <h1>ssssssssssssss</h1>  
        </div><!--/xg\_3col-->  
        <div class="xg\_1col last-child">  
            <?php xg\_sidebar(); ?>  
        </div><!--/xg\_col-->  
    </div><!--/xg\_colgroup-->  
</div><!--/#xg\_body-->  
<?php xg\_footer() ?>

  

[Read and post comments](http://osde-info.vox.com/library/post/ning-widget-configurationxml-and-mainphp.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00e398a39c8e0005?_c=feed-atom-full)
