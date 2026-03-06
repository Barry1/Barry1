---
title: Hints and ideas around Internet related setups
date: 23. März 2024
author: Dr. Bastian Ebeling
---

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
