#!/usr/bin/bash
download_whl_or_src() {
	echo "$1"
	python3 -m pip download --quiet --python-version 3.10 --platform win_amd64 --platform none --only-binary=:all: "$1" 2>/dev/null
	if [ $? -eq 1 ]; then
		python3 -m pip download --quiet --no-binary=:all: "$1"
	fi
}
export -f download_whl_or_src #for bash
#for x in $@; do
#    download_whl_or_src $x
#done
#https://www.gnu.org/software/parallel/parallel_alternatives.html#DIFFERENCES-BETWEEN-xargs-AND-GNU-Parallel
parallel download_whl_or_src {} --nice 18 ::: "$@"
