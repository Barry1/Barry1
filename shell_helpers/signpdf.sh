#!/usr/bin/bash

# This script could reside in ~/.local/bin or better be linked
# ln /home/ebeling/GitHub/Barry1/shell_helpers/signpdf.sh ~/.local/bin/signpdf.sh
# and the folder should be in your path

logopath=/home/ebeling/Dropbox/TSA/TSAundVfL/Sportwart/meta/TSAtrans.png
stamppath=/home/ebeling/Dropbox/TSA/TSAundVfL/Sportwart/meta/Sportwarttrans_r.png
signpath=/home/ebeling/Dropbox/TSA/TSAundVfL/Sportwart/meta/Unterschrifttrans_r.png

horizontal=${2:-350}
vertikal=${3:-570}

convert $logopath -resize 67% - \
    | composite -geometry +$(($horizontal+105+$RANDOM%32-16))+$(($vertikal+$RANDOM%32-16)) - "$1" - \
    | composite -geometry +$(($horizontal+$RANDOM%32-16))+$(($vertikal+10+$RANDOM%32-16)) $stamppath - - \
    | composite -geometry +$(($horizontal-85+$RANDOM%32-16))+$(($vertikal-15+$RANDOM%32-16)) $signpath - "${1%.pdf}_signed.pdf"
