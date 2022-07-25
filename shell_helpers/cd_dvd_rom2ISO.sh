#!/bin/sh
# inspired from <https://www.thomas-krenn.com/de/wiki/ISO_Image_von_CD_oder_DVD_unter_Linux_erstellen>

# Wenn $1 gesetzt, dass so benennen sonst
outisoname=${1:-cd_dvd_image.iso}

#isoinfo -d -i /dev/cdrom | grep -i -E 'block size|volume size'
#dd if=/dev/cdrom of=${outisoname} bs=<block size von oben> count=<volume size von oben> status=progress
dd if=/dev/cdrom of=${outisoname} status=progress