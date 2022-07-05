#!/usr/bin/sh

# This script could reside in ~/.local/bin or better be linked
# ln /home/ebeling/GitHub/Barry1/shell_helpers/pdfoptscreen.sh ~/.local/bin/pdfoptscreen.sh
# and the folder should be in your path

# inspired by <https://pdf.wondershare.com/pdf-knowledge/compress-pdf-linux.html>

# Details for CompatibilityLevel see <https://www.ghostscript.com/doc/9.54.0/VectorDevices.htm>
# <https://www.ghostscript.com/doc/current/VectorDevices.htm#:~:text=300-,CompatibilityLevel,-1.7>

gs \
    -dNOPAUSE\
    -dBATCH\
    -sDEVICE=pdfwrite\
    -dCompatibilityLevel=1.7\
    -dPDFSETTINGS=/screen\
    -sOutputFile="${1%.pdf}_opt_screen.pdf"\
    "$1"
