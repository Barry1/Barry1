---
title: Befehle und Infos um CDs zu rippen, zu brennen oder Musik zu konvertieren
date: 26. August 2023
author: Dr. Bastian Ebeling
---

## Tool allgemein und Installation

Das Tool `cdrecord` ist ein Link auf das Tool `wodim`.
Daher wird es mit dem Befehl `sudo apt-get install wodim` verfügbar gemacht.

Ein weitereres Tooles Tool ist `mp3splt`.
Ich empfehle die Installation mittels `sudo apt install --install-suggests --install-recommends mp3splt`.

## Informationen zu den verfügbare Laufwerken

```bash
cdrecord --devices
cdrecord -scanbus
cdparanoia -A
```

## Extrahieren

### BIN TOC CUE

```bash
cdrdao read-cd --with-cddb --device /dev/sr0 --datafile cd.bin cd.toc
mkcue /dev/sr0 > cd.cue
toc2cue cd.toc cd.cue
```

### WAV

```bash
cdparanoia --output-wav --batch
```

### MP3

```bash
CDDA_DEVICE=/dev/cdrom cdda2mp3
```

### Konvertierung

#### WAV2MP3

```bash
time parallel ffmpeg -loglevel error -hide_banner -i {} -acodec mp3 -b:a 128KB '{.}.mp3' ::: *.wav
```

## Brennen

```bash
cdrecord dev=1,0,0 -eject -audio *.wav
```

## Links

- [How Do I Burn MP3 onto an audio CD from Linux shell command prompt][def]
- [How do I write CD at Debian Linux command prompt][def2]
- [CD Abbild exakt rippen][CD_IMAGE_EXACT]

[def]: https://www.cyberciti.biz/tips/how-do-i-burn-mp3-onto-an-audio-cd-from-command-prompt.html
[def2]: https://www.cyberciti.biz/tips/how-do-i-write-cd-at-debain-linux-command-prompt.html
[CD_IMAGE_EXACT]: https://wiki.ubuntuusers.de/CDs_rippen/#Exaktes-CD-Abbild-rippen
