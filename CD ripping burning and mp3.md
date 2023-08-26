---
title: Befehle und Infos um CDs zu rippen, zu brennen oder Musik zu konvertieren
date: 26. August 2023
author: Dr. Bastian Ebeling
---

## Tool allgemein und Installation

Das Tool `cdrecord` ist ein Link auf das Tool `wodim`.
Daher wird es mit dem Befehl `sudo apt-get install wodim` verfügbar gemacht.

## Informationen zu den verfügbare Laufwerken

```bash
cdrecord --devices
cdrecord -scanbus
```

## Brennen

```bash
cdrecord dev=1,0,0 -eject -audio *.wav
```

## Links

- [How Do I Burn MP3 onto an audio CD from Linux shell command prompt][def]
- [How do I write CD at Debian Linux command prompt][def2]

[def]: https://www.cyberciti.biz/tips/how-do-i-burn-mp3-onto-an-audio-cd-from-command-prompt.html
[def2]: https://www.cyberciti.biz/tips/how-do-i-write-cd-at-debain-linux-command-prompt.html
