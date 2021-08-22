#!/bin/bash
# FORMATTED WITH BEAUTYSH <>
# reroute stdout to sderr
# exec 1>&2
# https://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html

cdpoetryupdate () {
    echo ${1%/poetry.lock}
    pushd ${1%/poetry.lock}
    poetry update
    git stage poetry.lock
    git commit -m "poetry update" poetry.lock
    git push
    popd

}

# make function available
export -f cdpoetryupdate #for bash

# do the work
# https://bash.cyberciti.biz/guide/Default_shell_variables_value
# default = current folder - else $1
workdir=${1:-.}
poetrylockfilelocations=`find $workdir -name poetry\.lock 2>/dev/null`
# https://www.gnu.org/software/parallel/
parallel cdpoetryupdate ::: $poetrylockfilelocations
