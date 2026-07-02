#!/bin/sh
#<https://wiki.debian.org/Firmware#Firmware_missing_from_Debian>
mkdir firmware
cd firmware || exit
wget -r -nd -e robots=no -A '*.bin' --accept-regex '/plain/' https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915/
sudo mv ./*.bin /lib/firmware/i915/
sudo update-initramfs -c -k all
