#!/usr/bin/sh

# This script could reside in ~/.local/bin or better be linked
# ln /home/ebeling/GitHub/Barry1/shell_helpers/pdftofaxtiff.sh ~/.local/bin/pdftofaxtiff.sh
# and the folder should be in your path

# inspired by <https://stackoverflow.com/a/10045299/617339>

gs \
	-o "${1%.pdf}_fax.tiff" \
	-sDEVICE=tiffg4 "$1"
