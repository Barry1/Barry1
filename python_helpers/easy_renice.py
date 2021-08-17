"""A little Tool for windows renicing named processes to above_normal."""
import sys
from typing import List

import psutil

if __name__ == "__main__":
    print(f'I will renice all "{sys.argv[1:]}"-processes.')
    processlist: List[psutil.Process] = [
        psutil.Process(thepid)
        for procname in sys.argv[1:]
        for thepid in psutil.pids()
        if psutil.Process(thepid).name() == procname
    ]
    for theprocess in processlist:
        theprocess.nice(
            psutil.ABOVE_NORMAL_PRIORITY_CLASS
        )  # noqa # pylint: disable=E1101
        print(f"{theprocess} with {repr(theprocess.nice())}")
