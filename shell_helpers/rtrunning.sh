#!/bin/sh
for a in $(pidof "$@"); do
	sudo chrt --all-tasks --pid 44 "${a}"
done
