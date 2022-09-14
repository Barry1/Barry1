#!/bin/sh
# inspired from <https://www.thomas-krenn.com/de/wiki/ISO_Image_von_CD_oder_DVD_unter_Linux_erstellen>
# <https://man7.org/linux/man-pages/man1/dash.1.html#:~:text=user%27s%20home%20directory).-,Parameter%20Expansion,-The%20format%20for>
# Wenn $1 gesetzt, dass so benennen sonst <https://devhints.io/bash>

outisoname=${1:-cd_dvd_image.iso}

echo "Reading /dev/cdrom into $outisoname"
if [ "$(which isoinfo)" ]
then
    mediainfo=$(isoinfo -d -i /dev/cdrom | grep -i -E 'block size is|volume size is')
    # Without the quotes/apostrophes the result will not show in two lines
    echo "$mediainfo"
    set -- "$(isoinfo -d -i /dev/cdrom | grep -i -E 'block size is|volume size is')"
    theblocksize=$5
    thevolumesize=$9
fi

if [ "$(which dcfldd1)" ]; then
    echo "Using dcfldd"
    dcfldd if=/dev/cdrom sizeprobe=if of="${outisoname}"
    elif [ "$(which pv1)" ] ; then
    echo "Using pv"
    pv /dev/cdrom | dd of="${outisoname}"
else
    echo "Fallback using dd"
    if [ -z "$theblocksize" ] || [ -z "$thevolumesize" ]
    then
        dd if=/dev/cdrom of="${outisoname}" status=progress
    else
        dd if=/dev/cdrom of="${outisoname}" bs="$theblocksize" count="$thevolumesize" status=progress
    fi
fi

# Benchmark
## dd
#949296+0 Datensätze ein
#949296+0 Datensätze aus
#486039552 Bytes (486 MB, 464 MiB) kopiert, 211,4 s, 2,3 MB/s
#real	3m31,415s
#user	0m0,678s
#sys	0m3,180s
## pv | dd
#949296+0 Datensätze ein
#949296+0 Datensätze aus
#486039552 Bytes (486 MB, 464 MiB) kopiert, 211,375 s, 2,3 MB/s
#
#real	3m31,434s
#user	0m1,519s
#sys	0m10,352s
## dcfldd
#14832+1 records in
#14832+1 records out
#
#real	3m31,396s
#user	0m0,096s
#sys	0m1,499s
