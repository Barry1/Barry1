---
title: Hints and ideas around Internet related setups
date: 20261108T110200Z
author: Dr. Bastian Ebeling
---

## Fritz

Since never firmwares, you can integrate DNS filters into the fritz.box.
Just open <http://fritz.box/#/network/settings/critical/dns-filter> and configure the following filter lists:

- [Big OISD](https://big.oisd.nl)
- [Hagezi](https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/pro.txt)
- [StevenBlack](https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts)

## (Dynamic) DNS

A really good overview on free providers of dynamic DNS services ist described on [GNUtomorrow](https://www.gnutomorrow.com/best-free-dynamic-dns-services/).
Following some names and/or links.

- [DuckDNS](https://www.duckdns.org/)
- https://freedns.afraid.org/
- DynDNS
- no-ip
- DYNU

Sometimes related to dynamic DNS there come up questions related to port warding.
Following this [link](https://portforward.com/) there are many interesting things to learn.
Just for backup reasons, you can also visit <https://archive.today/wg3Lt> or <https://web.archive.org/web/20240323101320/https://portforward.com/>.

## Captive Portals

- <http://detectportal.firefox.com/success.txt>
- <http://captive.apple.com/hotspot-detect.html>
- <http://neverssl.com>

Über die CLI kann es per `curl -LsI http://neverssl.com/` oder `wget -S --spider http://neverssl.com/` helfen.

### Examples

- <http://www.msftconnecttest.com/redirect>
- <http://www.msftconnecttest.com/connecttest.txt>
- <http://edge-http.microsoft.com/captiveportal/generate_204>
- <https://wifi-portal.munich-airport.de/108/portal/>

### Windows-Helfer

Oft laden Captive-Portal-Seiten schwierig, im _normalen_ Browser-Modus.\
Eine Empfehlung ist es, eine Verknüpfung mir dem Ziel `"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --inprivate --new-window --app=http://www.msftconnecttest.com/redirect` zu erstellen.\
So lädt der Browser mit minimalem Rahmen in einem _incognito-Modus_ die Captive-Portal-Seite.
Dies ist meinst schneller.
