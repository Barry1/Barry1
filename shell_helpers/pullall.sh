#!/bin/sh
# https://www.shellscript.sh/functions.html

handledir() {
	echo "=============== STARTING $1 ==============="
	#echo $1
	cd "$1"
	git pull --quiet
	[ -f pyproject.toml ] && poetry update --quiet
	#[ -f .trunk/trunk.yaml ] && trunk upgrade --ci --color --no-progress > /dev/null
	cd ..
	echo "=============== ENDING $1 ==============="
}

poetry self update --quiet
for founddir in */; do handledir "$founddir"; done
