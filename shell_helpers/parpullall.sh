#!/bin/bash
# https://www.shellscript.sh/functions.html

poetry self update --quiet

# Do --record-env into $PARALLEL_IGNORED_NAMES
#. `which env_parallel.dash`
#env_parallel --session

handledir() {
    echo "=============== STARTING $1 ==============="
    cd "$1"
    git pull --quiet 2>&1
    [ -f pyproject.toml ] && poetry update --quiet
    #[ -f .trunk/trunk.yaml ] && trunk upgrade --ci --color --no-progress > /dev/null
    cd ..
    echo "=============== ENDING $1 ==============="
}
export -f handledir
# https://medium.com/@alonisser/parallel-straight-from-your-command-line-feb6db8b6cee
# https://www.gnu.org/software/parallel/parallel.html#differences-between-gnu-parallel-and-alternatives
# https://www.gnu.org/software/parallel/parallel_examples.html#
parallel --jobs 0 --color --tag handledir ::: */
