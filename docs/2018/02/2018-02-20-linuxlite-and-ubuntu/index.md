---
title: "linuxlite and ubuntu midi and wave players"
date: 2018-02-20
categories: 
  - "osde"
tags: 
  - "midi"
  - "players"
  - "wave"
---

in linuxlite and ubuntu to get midi and wave players to work you need to install some packages such as sox and timidity

```
# aptitude install sox
# aptitude install playmidi
# aptitude install gsequencer
# aptitude install timidity
# aptitude install wildmidi
```

 

then download some midifiles such as

- https://freemidi.org/download-9185
- http://www.midiworld.com/files/2943

 

you can then play .WAV files and .MIDI files

```
$ play /boot/startupsound.wav
$ wildmidi Downloads/Mike_Oldfield_-_Moonlight_Shadow.mid
$ timidity Downloads/Mike_Oldfield_-_Moonlight_Shadow.mid
```

 

timidity has an amazing karaoke mode too

```
$ timidity Downloads/Mike_Oldfield_-_Moonlight_Shadow.mid 
Requested buffer size 32768, fragment size 8192
ALSA pcm 'default' set buffer size 32768, period size 8192 bytes
Playing Downloads/Mike_Oldfield_-_Moonlight_Shadow.mid
MIDI file: Downloads/Mike_Oldfield_-_Moonlight_Shadow.mid
Format: 1 Tracks: 10 Divisions: 384
Track name: Soft karaoke
Text: @KMIDI KARAOKE FILE
Track name: Words
Track name: melody 
Track name: sologitr
Track name: gitarren
Track name: fl�chen 
Track name: bass 
Track name: drums 
Track name: GS BY UT

Language: ENGL
Title: Moonlight Shadow
Title: Mike Oldfield
Title: Kar file made by Cowon MacLeod
@WThis song
@Wmay be used for non-commercial purposes only!

The last that ever she saw him
Carried away by a moonlight shadow
He passed on worried and warning
Carried away by a moonlight shadow.
Lost in a river last saturday night
```

 

unfortunately playmidi and xplaymidi still seem to be broken

```
$ xplaymidi Downloads/TwoForThePriceOfOne.mid 
Playmidi 2.4 Copyright (C) 1994-1997 Nathan I. Laredo, AWE32 by Takashi Iwai
This is free software with ABSOLUTELY NO WARRANTY.
For details please see the file COPYING.
open /dev/sequencer: No such file or directory
```

 

even if timidity is running as a service but with errors

```
# service timidity status
● timidity.service - LSB: start and stop timidity
 Loaded: loaded (/etc/init.d/timidity; bad; vendor preset: enabled)
 Active: active (exited) since Tue 2018-02-20 20:05:26 GMT; 14min ago
 Docs: man:systemd-sysv-generator(8)

Feb 20 20:05:25 ll38 systemd[1]: 
Starting LSB: start and stop timidity...
Feb 20 20:05:25 ll38 timidity[29186]: 
* Starting TiMidity++ ALSA midi emulation...
Feb 20 20:05:26 ll38 timidity[29186]: ...done.
Feb 20 20:05:26 ll38 systemd[1]: 
Started LSB: start and stop timidity.
Feb 20 20:05:27 ll38 pulseaudio[29200]: 
[autospawn] core-util.c: Home directory not accessible: 
Permission denied
Feb 20 20:16:51 ll38 systemd[1]: 
Started LSB: start and stop timidity.
```
