#!/bin/bash
# FORMATTED WITH BEAUTYSH <>
# reroute stdout to sderr
# exec 1>&2
# https://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html
cdpoetryupdate () {
    pushd ${1%/poetry.lock}
    if [ $(which niceload) ]
    then
        niceload poetry --quiet update
    else
        poetry --quiet update
    fi
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
echo "Working in $workdir"
poetrylockfilelocations=`find $workdir"/" -name poetry\.lock 2>/dev/null`
parallel --group  echo "found" ::: $poetrylockfilelocations
echo "==============================================================="
# https://www.gnu.org/software/parallel/
parallel --group --verbose cdpoetryupdate ::: $poetrylockfilelocations
# find $workdir -name poetry\.lock -print0 2>/dev/null | xargs --verbose --max-procs=0 --null -I {} bash -c 'cdpoetryupdate {}'
