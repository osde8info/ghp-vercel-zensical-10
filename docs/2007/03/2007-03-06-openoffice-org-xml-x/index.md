---
title: "OpenOffice.org XML &amp; XSLT"
date: 2007-03-06
categories: 
  - "osde"
tags: 
  - "odf"
  - "openoffice-org"
  - "opensource"
  - "xml"
  - "xslt"
---

[OpenOffice.org](http://www.openoffice.org/) 2 uses an XML format called the [OpenDocument Format](http://en.wikipedia.org/wiki/OpenDocument) (ODF).

To view the raw ODF XML just `unzip yourdoc.odt` then view the file `content.xml`.

Because ODF is XML it 'should' be easy to use XLST to convert it to any other markup language such as WritingML !

`   <?xml version="1.0" encoding="UTF-8"?>   <office:document-content   xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" xmlns:xlink="http://www.w3.org/1999/xlink"   xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0" xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0" xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0" xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0" xmlns:ooo="http://openoffice.org/2004/office"   xmlns:ooow="http://openoffice.org/2004/writer"   xmlns:oooc="http://openoffice.org/2004/calc"   xmlns:dom="http://www.w3.org/2001/xml-events"   xmlns:xforms="http://www.w3.org/2002/xforms"   xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"   office:version="1.0">   ...         [ACTUAL CONTENT]         ...`

[Read and post comments](http://osde-info.vox.com/library/post/openofficeorg-xml-xslt.html?_c=feed-atom-full#comments) | [Send to a friend](http://www.vox.com/share/6a00d4141b9517685e00d4142647de3c7f?_c=feed-atom-full)
