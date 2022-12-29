"""A little Tool for windows renicing named processes to above_normal."""
import sys
from typing import List

import psutil

if __name__ == '__main__':
    print(f'I will renice all "{sys.argv[1:]}"-processes.')
    processlist: List[psutil.Process] = [
        psutil.Process(thepid)
        for procname in sys.argv[1:]
        for thepid in psutil.pids()
        if psutil.Process(thepid).name().casefold() == procname.casefold()
    ]
    for theprocess in processlist:
        theprocess.nice(
            # pyright: reportUnknownMemberType=false
            # pyright: reportUnknownArgumentType=false
            # pyright: reportGeneralTypeIssues=false
            psutil.ABOVE_NORMAL_PRIORITY_CLASS
            if psutil.WINDOWS
            else 15
        )
        print(f'{theprocess} with {repr(theprocess.nice())}')
