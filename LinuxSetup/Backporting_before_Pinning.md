---
title: First try Backporting before Pinning
date: 3. Janaur 2025
author: Dr. Bastian Ebeling
---

Some Pinning Manuals tell you, to better not mix **stable** with **testing**.
But what do to best, if a package from **testing** is wanted?

I propose the following steps

## Description

### First - deb-src

Add Testing-Sources to your apt-sources - like this:

```sh
# https://tldp.org/LDP/abs/html/here-docs.html
# https://tldp.org/LDP/abs/html/abs-guide.html#GENERATESCRIPT
# https://stackoverflow.com/a/4414785
echo "Generating testing-Sources-File"
sudo tee /etc/apt/sources.list.d/testing_src.list > /dev/null <<EOF
###### testing_src.list
deb-src http://deb.debian.org/debian/ testing main contrib non-free
deb-src http://deb.debian.org/debian/ testing-updates main contrib non-free
EOF
echo "Updating apt sources"
sudo apt update
```

### Second - install build dependencies

```sh
sudo apt-get build-dep <PKGNAME>
```

### Third - backport/build package

```sh
sudo apt-get -b source <PKGNAME>
```

### Fourth - Install

```sh
sudo dpkg -i <PKGNAME>_VERSION.deb
```

## Example - Fastfetch

Fastfetch says, it depends on libyyjson-dev.
Thus it is not so easy. We need to prepare that package first - meaning also backporting

### Backporting **libyyjson-dev**

```bash
sudo apt-get build-dep yyjson
sudo apt-get -b source yyjson
sudo dpkg -i libyyjson-dev_0.10.0+ds-1_amd64.deb libyyjson0_0.10.0+ds-1_amd64.deb
```

### Backporting fastfetch

```bash
sudo apt-get build-dep fastfetch
sudo apt-get -b source fastfetch
sudo dpkg -i fastfetch_2.30.1+dfsg-1_amd64.deb
```

## Backporting details

For more facts around backporting have a look at the following Links

- [Building Formal Backports](https://wiki.debian.org/BuildingFormalBackports)
- [Simple Backport Creation](https://wiki.debian.org/SimpleBackportCreation)
- [Automatic Backport Creation](https://wiki.debian.org/AutomateBackports)
