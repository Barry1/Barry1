#!/bin/bash
# FORMATTED WITH BEAUTYSH <>
# reroute stdout to sderr
# exec 1>&2
# https://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html

cdpoetryupdate () {
    nicecmd="nice --adjustment=18"
    if [ "$(which niceload)" ]
    then
        nicecmd=niceload
    fi
    #    pushd ${1%/poetry.lock}
    pwd
    pushd "$1" || return # > /dev/null
    pwd
    echo "$nicecmd poetry --quiet update >> poetry.out"
    poetry --quiet update >> poetry.out
    git stage poetry.lock
    git commit --quiet -m "poetry update" poetry.lock >> git_commit.out
    git push --quiet
    popd > /dev/null || return 
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
poetrylockfilelocations=$(find "$workdir""/" -name poetry\.lock 2>/dev/null | grep --invert-match .venv)
#parallel --group  echo "found" ::: $poetrylockfilelocations
echo "==============================================================="
# https://www.gnu.org/software/parallel/
parallel --jobs 1 --verbose cdpoetryupdate {//} ::: "$poetrylockfilelocations"
# find $workdir -name poetry\.lock -print0 2>/dev/null | xargs --verbose --max-procs=0 --null -I {} bash -c 'cdpoetryupdate {}'
