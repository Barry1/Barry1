#!/bin/bash
# FORMATTED WITH BEAUTYSH <>
# reroute stdout to sderr
# exec 1>&2
# https://www.cyberciti.biz/tips/bash-shell-parameter-substitution-2.html
# do the work
# https://bash.cyberciti.biz/guide/Default_shell_variables_value
# default = current folder - else $1
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
find . -name \.git | grep -v \.venv | parallel --verbose $(dirname $0)/recursive_serial_poetry.sh {//}
