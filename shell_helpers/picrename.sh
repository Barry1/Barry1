#!/bin/sh

# Heimliche HEVC-Dateien von .jpeg in .heic umbenennen
#find . -name "*.jpeg" -execdir sh -c 'file "{}" | grep HEVC && mv "{}" "{}.heic" ' \;
find . -name "*.jpeg" -print -execdir sh -c 'file "$1" | grep HEVC && mv "$1" "${%1.jpeg}".heic' -- '{}' \;

# .JPG in .jpg umbenennen
#find . -name "*.JPG" -execdir sh -c 'echo "$1" "${1%.JPG}".jpg' - '{}' +
find . -name "*.JPG" -print -execdir sh -c 'mv "$1" "${1%.JPG}".jpg' -- '{}' \;

#find . -name "*.t1" -exec bash -c 'mv "$1" "${1%.t1}".t2' - '{}' +
