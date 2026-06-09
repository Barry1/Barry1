---
title: General information on running/using linux
date: 18. August 2024
author: Dr. Bastian Ebeling
---

## Downloadlinks

- [Alpine](https://alpinelinux.org/downloads/) [recent](http://www.tinycorelinux.net/15.x/x86/release/CorePlus-current.iso)
- [Tiny Core](http://www.tinycorelinux.net/install.html) [recent](https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/x86_64/alpine-extended-3.20.2-x86_64.iso)

## Booting ISO-Images

For booting ISO-Images I propose to put corresponding lines into your `/etc/grub.d/40_custom` file.

### Example KNOPPIX

````grub.cfg
# <https://www.heise.de/download/specials/Knoppix-komplett-3168624>
# <https://www.oreilly.com/library/view/knoppix-hacks-2nd/9780596514938/ch01.html#boot_from_a_cd_image>
menuentry "KNOPPIX 9.1 CD" {
    insmod loopback
    search --no-floppy --fs-uuid 2d905ffd-4160-420f-9f8c-214a8d92a2a2
    set isofile="/ISOs/KNOPPIX_V9.1CD-2021-01-25-DE.iso"
    loopback KNOPPIX $isofile
    #   linux (KNOPPIX)/boot/isolinux/linux64 boot=boot/isolinux iso-scan/filename=$isofile knoppix debug lang=de tz=Europe/Berlin
    #   linux (KNOPPIX)/boot/isolinux/linux64 bootfrom=/dev/disk/by-partuuid/bd874fed-01$isofile knoppix debug lang=de tz=Europe/Berlin
    linux (KNOPPIX)/boot/isolinux/linux64 bootfrom=/mnt-iso/$isofile knoppix64 lang=de tz=Europe/Berlin toram
    initrd (KNOPPIX)/boot/isolinux/minirt.gz
}

menuentry "KNOPPIX 9.1 DVD" {
    insmod loopback
    search --no-floppy --fs-uuid 2d905ffd-4160-420f-9f8c-214a8d92a2a2
    set isofile="/ISOs/KNOPPIX_V9.1DVD-2021-01-25-DE.iso"
    loopback KNOPPIX $isofile
    linux (KNOPPIX)/boot/isolinux/linux64 bootfrom=/mnt-iso/$isofile knoppix64 lang=de tz=Europe/Berlin
    initrd (KNOPPIX)/boot/isolinux/minirt.gz
}

menuentry "KNOPPIX 7.2 CD" {
    insmod loopback
    search --no-floppy --fs-uuid 2d905ffd-4160-420f-9f8c-214a8d92a2a2
    set isofile="/ISOs/KNOPPIX_V7.2.0CD-2013-06-16-DE.iso"
    loopback KNOPPIX $isofile
    linux (KNOPPIX)/boot/isolinux/linux bootfrom=/dev/sda1$isofile knoppix64 lang=de tz=Europe/Berlin toram
    #   linux (KNOPPIX)/boot/isolinux/linux bootfrom=/mnt-iso/$isofile knoppix64 lang=de tz=Europe/Berlin toram
    initrd (KNOPPIX)/boot/isolinux/minirt.gz
}

menuentry "KNOPPIX 7.0 CD" {
    insmod loopback
    search --no-floppy --fs-uuid 2d905ffd-4160-420f-9f8c-214a8d92a2a2
    set isofile="/ISOs/KNOPPIX_V7.0.5CD-2012-12-21-DE.iso"
    loopback KNOPPIX $isofile
    linux (KNOPPIX)/boot/isolinux/linux bootfrom=/mnt-iso/$isofile lang=de tz=Europe/Berlin
    initrd (KNOPPIX)/boot/isolinux/minirt.gz
}```

### Example

```grub.cfg
#sudo blkid /dev/sda1
#sudo blkid --output export
#/dev/sda1: LABEL="BWN12101" UUID="2d905ffd-4160-420f-9f8c-214a8d92a2a2" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="bd874fed-01"
#/dev/sda3: UUID="da533bb8-3e00-4660-83bc-327f77b0fa2e" TYPE="swap" PARTUUID="bd874fed-02"

menuentry "CorePlus" --class core --class gnu-linux --class gnu {
    insmod loopback
    search --no-floppy --fs-uuid 2d905ffd-4160-420f-9f8c-214a8d92a2a2
    set isofile="/ISOs/CorePlus-current.iso"
    loopback tiny $isofile
    linux (tiny)/boot/vmlinuz nozswap iso=/mnt/sda1${isofile} cde
#    linux (tiny)/boot/vmlinuz ISO=/mnt/sda1${isofile} loglevel=3 showapps cde
    # desktop=fluxbox
    # http://forum.tinycorelinux.net/index.php?topic=19391.0
#    linux (tiny)/boot/vmlinuz cde loglevel=3 desktop=flwm_topside laptop ISO=/mnt/sda1${isofile} nozswap
    # lst=xfbase.lst
    initrd (tiny)/boot/core.gz
}

menuentry "antiX 22 ISO Full toram" {
    insmod loopback
    search --no-floppy --fs-uuid 2d905ffd-4160-420f-9f8c-214a8d92a2a2
    set isofile="/ISOs/antiX-22_x64-full.iso"
    loopback antiX $isofile
    #   linux (antiX)/boot/isolinux/isolinux.bin bootfrom=/mnt-iso/$isofile (antiX)/antiX/vmlinuz
    linux (antiX)/antiX/vmlinuz1 from=hd fromiso=$isofile toram quiet splasht disable=lxF
    # lang=de tz=Europe/Berlin toram
    initrd (antiX)/antiX/initrd.gz
    #    KERNEL /antiX/vmlinuz
    #    APPEND quiet splasht disable=lxF

}



menuentry 'HBCD' {
    search -f '--set-root /HBCD_PE_x64.iso'
    drivemap '/HirensBootCD.iso' '(0xff)'
    drivemap '--hook' ''
    set root='(0xff)'; set legacy_hdbias='0'
    chainloader  '(0xff)'
}


menuentry "title Hiren's BootCD" {
    find --set-root /HBCD_PE_x64.iso
    map /HirensBootCD.iso (0xff)
    map --hook
    root (0xff)
    chainloader (0xff)
}
````
