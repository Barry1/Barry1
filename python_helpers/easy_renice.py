import sys

import psutil

if __name__ == "__main__":
    print(f'I will renice all "{sys.argv[1:]}"-processes.')
    processlist = [
        psutil.Process(thepid)
        for procname in sys.argv[1:]
        for thepid in psutil.pids()
        if psutil.Process(thepid).name() == procname
    ]
    for theprocess in processlist:
        theprocess.nice(psutil.ABOVE_NORMAL_PRIORITY_CLASS)
        print(f"{theprocess} with {repr(theprocess.nice())}")
