#!/bin/sh
# Heimliche HEVC-Dateien von .jpeg in .heic umbenennen
find . -name *.jpeg -execdir sh -c 'file "{}" | grep HEVC && mv "{}" "{}.heic" ' \;
# .JPG in .jpg umbenennen
find . -name *.JPG -execdir mv \{\} \{\}.jpg \;
#ISO Media, HEIF Image HEVC Main or Main Still Picture Profile
