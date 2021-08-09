"""traverses through moved WhatsApp media folder and moves files into date-folders"""
import glob
import os

BASEDIRTOWORKIN = "/mnt/rsyncdir/"


def placefile(completefilepath: str) -> None:
    """Finds Date from Filename, creates Folder and moves into."""
    basepath = os.path.dirname(completefilepath)
    targetpath = basepath + os.sep + os.path.basename(completefilepath).split("-")[1]
    print(f"We should move {completefilepath} into {targetpath}")
    if not os.path.isdir(targetpath):
        os.mkdir(targetpath)
    os.rename(
        completefilepath, targetpath + os.sep + os.path.basename(completefilepath)
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
