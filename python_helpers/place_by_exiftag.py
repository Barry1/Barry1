"""Processes Images and moves into SubFolder for Year and Day."""

import glob
import os
import sys

import piexif

# formatted with `autopep8 --in-place place_by_exiftag_py2.py`
# formatted with `isort place_by_exiftag_py2.py`
# isort --profile=black --py=27 place_by_exiftag_py2.py


def processfile(thepath, thefilename):
    srcpath = thepath + os.sep + thefilename
    print(srcpath)
    exif_dict = piexif.load(srcpath)
    try:
        thetagdata = exif_dict["Exif"][36867]  # DateTimeOriginal
    except KeyError:
        pass
    else:
        dasjahr = thetagdata[:4]
        dermonat = thetagdata[5:7]
        dertag = thetagdata[8:10]
        targetfolder = (
            thepath
            + os.sep
            + dasjahr.decode()
            + os.sep
            + dasjahr.decode()
            + dermonat.decode()
            + dertag.decode()
        )
        try:
            os.makedirs(targetfolder)
        except OSError as theerr:
            # print(theerr)
            pass
        # Dateien (egal welche Erweiterung) verschieben
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
    if len(sys.argv) > 1:
        thepath = sys.argv[1]
    else:
        thepath = "/share/Fotos/IPhoneMove"
    print(thepath)
    alledateien = os.listdir(thepath)
    for gefunden in alledateien:
        if (
            gefunden.lower().endswith(".jpg") or gefunden.lower().endswith(".jpeg")
        ) and gefunden.startswith("IMG"):
            processfile(thepath, gefunden)
