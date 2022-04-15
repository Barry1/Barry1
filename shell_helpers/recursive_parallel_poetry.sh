#!/bin/bash
# FORMATTED WITH BEAUTYSH <>
# reroute stdout to sderr
# exec 1>&2
# https://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html
cdpoetryupdate () {
    #    pushd ${1%/poetry.lock}
    pushd $1 > /dev/null
    if [ $(which niceload) ]
    then
        niceload poetry update >> poetry.out
    else
        poetry --quiet update >> poetry.out
    fi
    git stage poetry.lock
    git commit --quiet -m "poetry update" poetry.lock >> git_commit.out
    git push --quiet
    popd > /dev/null
}
# make function available
export -f cdpoetryupdate #for bash
# do the work
# https://bash.cyberciti.biz/guide/Default_shell_variables_value
# default = current folder - else $1
workdir=${1:-.}
echo "Working in $workdir"
# Bash/find does not support PCRE (Perl compatible regular expressions)
# Good tools: <https://regex-generator.olafneumann.org/>
# <https://regex101.com/>
# <https://www.freeformatter.com/regex-tester.html>
# <https://danielfett.de/2006/03/20/regulaere-ausdruecke-tutorial/>
# <https://regexr.com/>
# <https://extendsclass.com/regex-tester.html>
# <https://jex.im/regulex/>
poetrylockfilelocations=`find $workdir"/" -name poetry\.lock 2>/dev/null | grep --invert-match .venv`
parallel --tag --group  echo "found" ::: $poetrylockfilelocations
echo "==============================================================="
# https://www.gnu.org/software/parallel/
parallel --tag --group --verbose cdpoetryupdate {//} ::: $poetrylockfilelocations
# find $workdir -name poetry\.lock -print0 2>/dev/null | xargs --verbose --max-procs=0 --null -I {} bash -c 'cdpoetryupdate {}'
