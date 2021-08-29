#!/bin/bash
# FORMATTED WITH BEAUTYSH <>
# reroute stdout to sderr
# exec 1>&2
# https://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html
cdpoetryupdate () {
    echo $0
    echo $1
    echo ${1%/poetry.lock}
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
case "$1" in
*/)
    tempworkdir=$1
    ;;
*)
    tempworkdir="$1/"
    ;;
esac
workdir=${tempworkdir:-.}
echo "Working in $workdir"
poetrylockfilelocations=`find $workdir -name poetry\.lock 2>/dev/null`
parallel --verbose echo ::: $poetrylockfilelocations
echo "==============================================================="
# https://www.gnu.org/software/parallel/
parallel --verbose cdpoetryupdate ::: $poetrylockfilelocations
# find $workdir -name poetry\.lock -print0 2>/dev/null | xargs --verbose --max-procs=0 --null -I {} bash -c 'cdpoetryupdate {}'
