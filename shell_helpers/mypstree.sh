#!/bin/sh -x
# THEPID=$(pidof -s "$1") && pstree --compact-not --long --thread-names --show-parents --show-pids "$THEPID"
if THEPID=$(pidof -s "$1"); then
	pstree --compact-not --long --thread-names --show-parents --show-pids "$THEPID"
fi
