#!/bin/sh
# FORMATTED WITH BEAUTYSH <>
# reroute stdout to sderr
# exec 1>&2
echoandrun () {
    echo ==================== $1 ====================
    if [ $(which $1) ]
    then
        $@ $FILE
    fi
}
if [ -n "$1" ]
then
    FILE=$1
else
    FILE=`tree -if|egrep "\.pyi?$"`
fi
echoandrun isort --profile=black
echoandrun black
echoandrun interrogate
exit 0