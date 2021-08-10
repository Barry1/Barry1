#!/bin/sh
# FORMATTED WITH BEAUTYSH <>
# reroute stdout to sderr
exec 1>&2
echo ==========================PRETTIER=========================================
if [ $(which prettier) ]
then
    echo prettier --ignore-unknown --write $1
fi
echo ==========================ISORT=========================================
if [ $(which isort) ]
then
    isort --profile=black $1
fi
echo ==========================BLACK=========================================
if [ $(which black) ]
then
    black $1
fi
echo ==========================INTERROGATE=========================================
if [ $(which interrogate) ]
then
    interrogate $1
fi
exit 0