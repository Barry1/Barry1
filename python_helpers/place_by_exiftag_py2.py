#!/usr/bin/env python2.7
import glob
import os

import piexif

# https://pypi.org/project/piexif
# curl  -O -J https://files.pythonhosted.org/packages/fa/84/a3f25cec7d0922bf60be8000c9739d28d24b6896717f44cc4cfb843b1487/piexif-1.1.3.zip
# unzip piexif-1.1.3.zip
# mv piexif /mnt/ext/opt/Python/lib/python2.7/site-packages/

# formatted with `autopep8 --in-place place_by_exiftag_py2.py`
# formatted with `isort --in-place place_by_exiftag_py2.py`


def processfile(thepath, thefilename):
    srcpath = thepath + os.sep + thefilename
    exif_dict = piexif.load(srcpath)
    thetagdata = exif_dict["Exif"][36867]  # DateTimeOriginal
    dasjahr = thetagdata[:4]
    dermonat = thetagdata[5:7]
    dertag = thetagdata[8:10]
    targetfolder = thepath + os.sep + dasjahr + os.sep + dasjahr + dermonat + dertag
    try:
        os.makedirs(targetfolder)
    except OSError as theerr:
        # print(theerr)
        pass
    # Dateien (egal welche Erweiterung) verschieben
    print(srcpath)
    for gleichedatei in glob.glob(srcpath[:-4] + "*"):
        try:
            os.rename(
                gleichedatei,
                targetfolder + os.sep + gleichedatei[len(thepath) + 1 :],
            )
        except OSError as theerr:
            print(
                "rename",
                gleichedatei,
                targetfolder + os.sep + gleichedatei[len(thepath) + 1 :],
                "resulted in:",
            )
            print(theerr)


if __name__ == "__main__":
    thepath = "/share/BastiPhone"
    alledateien = os.listdir(thepath)
    for gefunden in alledateien:
        if gefunden.endswith(".jpg") and gefunden.startswith("IMG_"):
            processfile(thepath, gefunden)
