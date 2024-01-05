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

localmodconfig - Update current config disabling modules not loaded
except those preserved by LMC_KEEP environment variabl
LMC_KEEP="drivers/usb:drivers/gpu:fs" \
**CIFS in LMC_KEEP**
using config: '.config'
WARNING: NETFS_SUPPORT is required, but nothing in the
current config selects it.
WARNING: NETFS_SUPPORT is required, but nothing in the
current config selects it.
module dns_resolver did not have configs CONFIG_DNS_RESOLVER
module cifs_md4 did not have configs CONFIG_SMBFS
module netfs did not have configs CONFIG_NETFS_SUPPORT
module fscache did not have configs CONFIG_FSCACHE
module cifs did not have configs CONFIG_CIFS
module nls_utf8 did not have configs CONFIG_NLS_UTF8
module cifs_arc4 did not have configs CONFIG_SMBFS

#

# configuration written to .config

#

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
yes "" | make LMC_KEEP="fs/smb" localmodconfig # nur genutzte Module aktiv lassen
# Hint: at this point you might want to adjust the build configuration; you'll
#   have to, if you are running Debian. See below for details.
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
time nice -n 20 make --jobs=$(( 2 * $(getconf _NPROCESSORS_ONLN) )) --load-average=$(getconf _NPROCESSORS_ONLN) CFLAGS='-march=native -O3 -flto -pipe' CXXFLAGS='-march=native -O3 -flto -pipe' all
sudo sh -c command -v installkernel && sudo make modules_install install
reboot
```

[Interessant](https://github.com/sn99/Optimizing-linux)

## Boot Parameter

### acpi_enforce_resources

https://www.kernel.org/doc/Documentation/admin-guide/kernel-parameters.txt

`/etc/default/grub`

`acpi_enforce_resources=lax`

acpi_enforce_resources= [ACPI]
{ strict | lax | no }
Check for resource conflicts between native drivers
and ACPI OperationRegions (SystemIO and SystemMemory
only). IO ports and memory declared in ACPI might be
used by the ACPI subsystem in arbitrary AML code and
can interfere with legacy drivers.
strict (default): access to resources claimed by ACPI
is denied; legacy drivers trying to access reserved
resources will fail to bind to device using them.
lax: access to resources claimed by ACPI is allowed;
legacy drivers trying to access reserved resources
will bind successfully but a warning message is logged.
no: ACPI OperationRegions are not marked as reserved,
no further checks are performed.

            lax

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
