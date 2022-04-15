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
echoandrun isort --skip=venv --profile=black
echoandrun black --force-exclude venv
echoandrun interrogate
echoandrun mypy --install-types --non-interactive --pretty --show-error-codes --strict --check-untyped-defs --ignore-missing-imports
echoandrun pylama --linters mccabe,pep257,pydocstyle,pycodestyle,pyflakes,radon,pylint,mypy,isort
exit 0