"""Traverses through moved WhatsApp media folder and moves files into date-folders."""
import glob
import os
from typing import Literal

BASEDIRTOWORKIN: Literal["/mnt/rsyncdir/"] = "/mnt/rsyncdir/"


def placefile(completefilepath: str) -> None:
    """Find Date from Filename, create Folder and move into."""
    basepath: str = os.path.dirname(completefilepath)
    targetpath: str = (
        basepath + os.sep + os.path.basename(completefilepath).split("-")[1]
    )
    print(f"We should move {completefilepath} into {targetpath}")
    if not os.path.isdir(targetpath):
        os.makedirs(targetpath)
    os.rename(
        completefilepath,
        targetpath + os.sep + os.path.basename(completefilepath),
    )


if __name__ == "__main__":
    for wrkpath in [
        BASEDIRTOWORKIN + a
        for a in os.listdir(BASEDIRTOWORKIN)
        if a.find("WhatsApp") == 0 and a.find("WhatsApp Documents") == -1
    ]:
        for foundfile in glob.glob(wrkpath + os.sep + "*"):
            if os.path.isfile(foundfile):
                print(foundfile)
                placefile(foundfile)
    print("Ready.")
