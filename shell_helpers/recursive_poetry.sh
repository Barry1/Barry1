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
    if [ $(which niceload) ]
    then
        nicecmd=niceload
    fi
    #    pushd ${1%/poetry.lock}
    pushd $1 > /dev/null
    poetry --quiet update >> poetry.out
    popd > /dev/null
}
# make function available
export -f cdpoetryupdate #for bash
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
poetrylockfilelocations=`find $workdir"/" -name poetry\.lock 2>/dev/null | grep --invert-match .venv`
#parallel --group  echo "found" ::: $poetrylockfilelocations
echo "==============================================================="
# https://www.gnu.org/software/parallel/
parallel --verbose cdpoetryupdate {//} ::: $poetrylockfilelocations
