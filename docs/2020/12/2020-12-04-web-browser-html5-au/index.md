---
title: "web browser #html5 audio and video #codec problems (@LondonRealTV)"
date: 2020-12-04
categories: 
  - "osde"
---

web browsers (chrome, chromium, edge, firefox, opera, safari) that support html5 should be able to natively play audio and video however you can only guarantee that open www codecs / formats will work such as OGG & WEBM and NOT MP4 or VP8 or VP9

(some sites such as https://londonreal.tv/ wont play videos until you fix these settings)

mozilla firefox has a separate plugin for openh264 (https://www.openh264.org/) that is enabled by default on some distros and not others

for example on oracle unbreakable enterprise linux 7 (and red hat 7 ? and centos 7 ?) the openh264 is DISABLED by default

- run firefox
- click preferences
- click extensions
- click plugins
- locate openh264 (disabled)
- click the … icon

then chose always from the following 3 options

```
ask
always
never
```

see also

- https://developer.mozilla.org/en-US/docs/Web/Media/Formats
- https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Video\_codecs

- https://www.chromium.org/audio-video
- https://support.mozilla.org/en-US/kb/html5-audio-and-video-firefox
- https://support.mozilla.org/en-US/kb/open-h264-plugin-firefox

- http://camendesign.com/code/video\_for\_everybody
- http://camendesign.com/code/video\_for\_everybody/test.html
- http://html5videocreator.github.io/html5-supported-video-formats.html
