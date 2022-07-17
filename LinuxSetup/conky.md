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

alter Wert|neuer Wert|Grund
---|---|---
sinal:|Signal:|Tippfehler
eth0|enp0s25|alte Bezeichnung
wlan0|wlo1|alte Bezeichnung


## lauffähige Konfigurations-Datei

@import ".conkyrc" {code_block=true, style=json}

<https://www.ubuntupit.com/best-conky-themes-for-linux/>

## Notizen

https://weather.codes/search/?q=Kummerfeld https://weather.com/weather/today/l/GMXX4208

http://www.bbc.co.uk/weather (https://openweathermap.org/city/2882543)
