---
title: Kernel-relevante Einstellungen und Informationen
author: Dr. Bastian Ebeling
date: 30. Dezember 2023
---

## Kernel bauen/compilieren

<https://docs.kernel.org/admin-guide/quickly-build-trimmed-linux.html>

### Kurzanleitung

Vorbereitung

```bash
apt install --install-suggests --install-recommends bc binutils bison dwarves flex gcc git make openssl pahole perl-base libssl-dev libelf-dev
dmesg --color  --level err,warn
```

Ausführung

```Makefile
#NUMCPUS?=$(shell nproc)
#NUMCPUS?=$(shell getconf _NPROCESSORS_ONLN)
NUMCPUS?=$(shell grep "core id" /proc/cpuinfo  | uniq | wc -l)
MAKEFLAGS += --jobs --load-average=$(NUMCPUS) --output-sync=recurse
SHELL = /usr/bin/nice
.SHELLFLAGS = -n 20 /usr/bin/sh -c
```

```bash
git clone --depth 1 -b linux-rolling-stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git ~/linux/
cd ~/linux/
echo "-bastitest" > localversion
yes "" | make localmodconfig # nur genutzte Module aktiv lassen
# Hint: at this point you might want to adjust the build configuration; you'll
#   have to, if you are running Debian. See below for details.
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
time nice -n 20 make --jobs=$(( 2 * $(getconf _NPROCESSORS_ONLN) )) --load-average=$(getconf _NPROCESSORS_ONLN) CFLAGS='-march=native -O3 -flto -pipe' CXXFLAGS='-march=native -O3 -flto -pipe' all
command -v installkernel && sudo make modules_install install
reboot
```

[Interessant](https://github.com/sn99/Optimizing-linux)

## Boot Parameter

### zswap

Mit dem Boot-Parameter `zswap.enabled=1` wird eine transparenter Kompression des SWAP-Spaces aktiviert.
Weitere Informationen dazu sind unter [dem][MMzswap] und [dem Link][Doc418zswap] zu finden.

### mitigations

Mit dem Boot-Parameter `mitigations=off` werden sicherheitsrelevante Prüfungen deaktiviert, die zu einer Performance-Steigerung führen können.
<https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html#:~:text=mitigations%3D>

[MMzswap]: https://docs.kernel.org/admin-guide/mm/zswap.html "Kernel Admin Guide Memory Management: zswap"
[Doc418zswap]: https://www.kernel.org/doc/html/v4.18/vm/zswap.html "Kernel Doc Virtual Memory: zswap"

## Boot Analyse

```bash
systemd-analyze time
systemd-analyze blame
systemd-analyze plot > boot.svg ; xdg-open boot.svg`
```
