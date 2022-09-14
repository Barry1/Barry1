# Nutzung von Conky mit conky-colors

## Vorbereitung

### conky-colors

Zur Installation von conky-colors kann einfach die letzter Version von github genutzt werden:

```bash
git clone https://github.com/helmuthdu/conky_colors
```

In dem neuen Verzeichnis muss nun

```bash
make
make install
```

ausgeführt werden.

### System

Da Conky ein Update der Konfigurationsdatei erfahren hat, müssen ggf. Scripte umgeschrieben werden.
Hierzu müssen folgende Abhändigkeiten installiert werden:

```bash
sudo apt-get install lua5.4 dos2unix ncal
sudo chmod a+x /usr/share/doc/conky-all/convert.lua
```

Das Paet `ncal` dient der Darstellung von Kalendern. Mir ist die Nutzung noch nicht geglückt

## Erstellen einer Konfiguration

Leider ist das Skript ein wenig veraltet.
Die Nutzung/Integration von Wetter ist derzeit nicht möglich.

Ich verwende

```bash
conky-colors --debian --lang=de --cpu=4 --cputemp --swap --battery --proc=5 --clock=default --hd=default --network --side=left --updates
/usr/share/doc/conky-all/convert.lua ~/.conkycolors/conkyrc ~/.conkyrc
conky  --daemonize
```

Der erste Aufruf erzeugt eine Konfiguration im alten Format an dem Pfad `~/.conkycolors/conkyrc`.
Der zweite Befehl konvertiert diese Konfiguration in das neue Format und schreibt sie als Standard unter `~/.conkyrc`.
Der dritte Befehl startet conky im Hintergrund.

## spezifische Korrekturen

| alter Wert | neuer Wert | Grund            |
| ---------- | ---------- | ---------------- |
| sinal:     | Signal:    | Tippfehler       |
| eth0       | enp0s25    | alte Bezeichnung |
| wlan0      | wlo1       | alte Bezeichnung |

## lauffähige Konfigurations-Datei

@import ".conkyrc" {code_block=true, style=lua}

## Autostart

Um conky gleich beim Login zu starten, hilft die Datei ``.
Bei mir ist der Inhalt

```.desktop
[Desktop Entry]
Type=Application
Name=conky
Exec=conky --daemonize --pause=7
StartupNotify=false
Terminal=false
Icon=conky-logomark-violet
Categories=System;Monitor;
```

Je nach Systemgeschwindigkeit, muss der Wert bei pause Variiert werden.

## Notizen

<https://www.ubuntupit.com/best-conky-themes-for-linux/>

<https://weather.codes/search/?q=Kummerfeld> <https://weather.com/weather/today/l/GMXX4208>

<http://www.bbc.co.uk/weather> <https://openweathermap.org/city/2882543>

### conky-manager

In dem Repository <https://github.com/teejee2008/conky-manager/> steht eine GUI zur Verwaltung zur Verfügung.

### Open Weather Map

| Ort                 | id      |
| ------------------- | ------- |
| Kummerfeld          | 2882543 |
| Büsum               | 6551306 |
| Niendorf (Ostsee)   | 2862601 |
| Timmendorfer Strand | 2822160 |
| Sylt-Ost            | 3208571 |
| Sankt-Peter Ording  | 6551599 |

<https://github.com/chubin/wttr.in#conky>

Alt:
<http://conky.sourceforge.net/variables.html>
Neu: <https://github.com/brndnmtthws/conky/blob/main/doc/variables.xml>

ANLTEIUNG: <https://github.com/brndnmtthws/conky/wiki>

man -P "less -p 'CONFIGURATION SETTINGS'" conky

<https://wttr.in/:help>
<https://wttr.in/Kummerfeld>

[API Beschreibung](https://openweathermap.org/current)

<https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}>

[http://api.openweathermap.org/data/2.5/forecast?id=2882543&APPID=6be5e3a6e62680c28044791e8fc7b568&units=metric](Kummerfeld)

2882543
