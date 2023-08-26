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
