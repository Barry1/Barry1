#!/bin/bash
# FORMATTED WITH BEAUTYSH <>
# reroute stdout to sderr
# exec 1>&2
# https://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html
# do the work
# https://bash.cyberciti.biz/guide/Default_shell_variables_value
# default = current folder - else $1
cdpoetryupdate () {
    nicecmd="nice --adjustment=18"
    if [ "$(which niceload)" ]
    then
        nicecmd="niceload"
    fi
    #    pushd ${1%/poetry.lock}
    pushd "$1" > /dev/null || return
    echo "====================== $(date) ===================" >> poetry.out
    $nicecmd poetry update >> poetry.out
    popd > /dev/null || return
}
cdgitcommit () {
    pushd "$1" > /dev/null || return
    # poetrylockfiles=$(find . -name poetry.lock|grep -v \.venv)
    poetrylockfiles=$(git ls-files poetry.lock)
    if [ -n "$poetrylockfiles" ]
    then
        echo "====================== $(date) ===================" >> git_commit.out
        git commit --quiet -m "poetry update" "$poetrylockfiles" >> git_commit.out
        git push --quiet
    fi
    #    find . -name poetry.lock|parallel --jobs =1 'git stage {};git commit --quiet -m "poetry update" {} >> git_commit.out;git push --quiet'
    popd > /dev/null || return
}
# make function available
export -f cdpoetryupdate #for bash
export -f cdgitcommit #for bash
workdir=${1:-.}
echo "Working parallel in $workdir"
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
# shellcheck disable=SC1083
parallel --verbose cdpoetryupdate {//} ::: "$poetrylockfilelocations"
echo "==============================================================="
# shellcheck disable=SC1083
find "$workdir""/" -name \.git | grep -v \.venv | parallel --verbose cdgitcommit {//}
