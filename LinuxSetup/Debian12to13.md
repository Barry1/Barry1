---
title: Update Debian 12 bookworm to 13 trixie
date: 2025-08-11
author: Dr. Bastian Ebeling
---

## Deb822 source-Files

### Internal Tool

`apt modernize-sources`

### Weiteres Tool

RepoLib and Apt-Manage is intended to operate strictly with DEB822-style sources. Some software may automatically add or modify existing one-line sources within your system configuration. Because of this, Apt-Manage includes a conversion utility to automatically generate DEB822 sources from any active one-line sources in your system configuration.

`apt-manage`

<https://repolib.readthedocs.io/en/1.0/aptmanage/convert.html>
