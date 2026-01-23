"""Processes Images and moves into SubFolder for Year and Day."""

import glob
import os
import sys
from logging import INFO, Logger, basicConfig, getLogger
import piexif

thelogger: Logger = getLogger(__name__)


def processfile(thepath, thefilename) -> None:
    srcpath = thepath + os.sep + thefilename
    thelogger.info(srcpath)
    exif_dict = piexif.load(srcpath)
    try:
        thetagdata = exif_dict["Exif"][36867]  # DateTimeOriginal
    except KeyError as thekeyerror:
        thelogger.error(thekeyerror)
    else:
        dasjahr = thetagdata[:4]
        dermonat = thetagdata[5:7]
        dertag = thetagdata[8:10]
        targetfolder: str = (
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
            thelogger.error(theerr)
        # Dateien (egal welche Erweiterung) verschieben
        for gleichedatei in glob.glob(f"{srcpath[:-4]}*"):
            try:
                os.rename(
                    gleichedatei,
                    targetfolder + os.sep + gleichedatei[len(thepath) + 1 :],
                )
            except OSError as theerr:
                thelogger.error(
                    "rename %s to %s resulted in:",
                    gleichedatei,
                    targetfolder + os.sep + gleichedatei[len(thepath) + 1 :],
                    theerr,
                )


if __name__ == "__main__":
    if __debug__:
        basicConfig(level=INFO)
    thepath: str = sys.argv[1] if len(sys.argv) > 1 else "/share/Fotos/IPhoneMove"
    thelogger.info("Processing Path: %s", thepath)
    alledateien: list[str] = os.listdir(path=thepath)
    for gefunden in alledateien:
        if (
            gefunden.lower().endswith(".jpg") or gefunden.lower().endswith(".jpeg")
        ) and gefunden.startswith("IMG"):
            processfile(thepath=thepath, thefilename=gefunden)
