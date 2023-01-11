#!/bin/bash
# exiftool "-Directory<DateTimeOriginal" -d "%Y/%Y%m%d" IMG_0*
exiftool -DateTimeOriginal -d "%Y%m%d" -FileName ./IMG* -tab -s2 | grep -v ======== | sort
