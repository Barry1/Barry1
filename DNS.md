---
title: DNS Server für besseres und sichereres Internet
date: 21. Oktober 2025
author: Dr. Bastian Ebeling
---

## DNS 4 EU

<https://www.joindns4.eu/for-public>

| Protokoll      |                                    NoTrack |                         NoAd, NoTrack |                                   NoFilter |                         NoTrack,NoSex |                         NoAd, NoTrack,NoSex |
| -------------- | -----------------------------------------: | ------------------------------------: | -----------------------------------------: | ------------------------------------: | ------------------------------------------: |
| IPv4           |                                 86.54.11.1 |                           86.54.11.13 |                               86.54.11.100 |                           86.54.11.12 |                                 86.54.11.11 |
| IPv4 redun     |                               86.54.11.201 |                          86.54.11.213 |                               86.54.11.200 |                          86.54.11.212 |                                86.54.11.211 |
| IPv6           |                      2a13:1001::86:54:11:1 |                2a13:1001::86:54:11:13 |                    2a13:1001::86:54:11:100 |                2a13:1001::86:54:11:12 |                      2a13:1001::86:54:11:11 |
| IPv6 redun     |                    2a13:1001::86:54:11:201 |               2a13:1001::86:54:11:213 |                    2a13:1001::86:54:11:200 |               2a13:1001::86:54:11:212 |                     2a13:1001::86:54:11:211 |
| DNS-over-HTTPS | <https://protective.joindns4.eu/dns-query> | <https://noads.joindns4.eu/dns-query> | <https://unfiltered.joindns4.eu/dns-query> | <https://child.joindns4.eu/dns-query> | <https://child-noads.joindns4.eu/dns-query> |
| DNS-over-TLS   |             <tls://protective.joindns4.eu> |             <tls://noads.joindns4.eu> |             <tls://unfiltered.joindns4.eu> |             <tls://child.joindns4.eu> |             <tls://child-noads.joindns4.eu> |

## AdGuard DNS

<https://adguard-dns.io/de/public-dns.html?_plc=de>

| Protokoll      |                       NoAd, NoTrack |                                       NoFilter |                       NoAd, NoTrack, NoSex |
| -------------- | ----------------------------------: | ---------------------------------------------: | -----------------------------------------: |
| IPv4           |                        94.140.14.14 |                                  94.140.14.140 |                               94.140.14.15 |
| IPv4 redun     |                        94.140.15.15 |                                  94.140.14.141 |                               94.140.15.16 |
| IPv6           |                   2a10:50c0::ad1:ff |                                2a10:50c0::1:ff |                         2a10:50c0::bad1:ff |
| IPv6 redun     |                   2a10:50c0::ad2:ff |                                2a10:50c0::2:ff |                         2a10:50c0::bad2:ff |
| DNS-over-HTTPS | <https://dns.adguard.com/dns-query> | <https://unfiltered.adguard-dns.com/dns-query> | <https://family.adguard-dns.com/dns-query> |
| DNS-over-TLS   |             <tls://dns.adguard.com> |             <tls://unfiltered.adguard-dns.com> |             <tls://family.adguard-dns.com> |
| DNS-over-QUIC  |        <quic://dns.adguard-dns.com> |            <quic://unfiltered.adguard-dns.com> |            <quic://family.adguard-dns.com> |
