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
```

Ausführung

```bash
git clone --depth 1 -b master https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git ~/linux/
cd ~/linux/
# Hint: if you want to apply patches, do it at this point. See below for details.
# Hint: it's recommended to tag your build at this point. See below for details.
echo "-basti_probiert" > localversion
yes "" | make localmodconfig
# Hint: at this point you might want to adjust the build configuration; you'll
#   have to, if you are running Debian. See below for details.
make -j $(nproc --all)
# Note: on many commodity distributions the next command suffices, but on Arch
#   Linux, its derivatives, and some others it does not. See below for details.
command -v installkernel && sudo make modules_install install
reboot
```

## Boot Parameter

### zswap

Mit dem Boot-Parameter `zswap.enabled=1` wird eine transparenter Kompression des SWAP-Spaces aktiviert.
Weitere Informationen dazu sind unter [dem][MMzswap] und [dem Link][Doc418zswap] zu finden.

### mitigations

Mit dem Boot-Parameter `mitigations=off` werden sicherheitsrelevante Prüfungen deaktiviert, die zu einer Performance-Steigerung führen können.
<https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html#:~:text=mitigations%3D>

[MMzswap]: https://docs.kernel.org/admin-guide/mm/zswap.html "Kernel Admin Guide Memory Management: zswap"
[Doc418zswap]: https://www.kernel.org/doc/html/v4.18/vm/zswap.html "Kernel Doc Virtual Memory: zswap"
