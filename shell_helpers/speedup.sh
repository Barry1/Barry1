#!/bin/sh
# $* and $@ deliver all arguments
# for further explanation see
# <https://stackoverflow.com/a/28099707/207661>
# or <http://wiki.bash-hackers.org/scripting/posparams>

NICELEVEL=-7

## Old solution - some problem in user rights
#sudo nice --adjustment=$NICELEVEL runuser --user="$USER" "$@"

## other solution
# nice --adjustment=-10 runuser -u ebeling code
# nice --adjustment=-10 runuser -u ebeling -c code
#"$@" &
#sudo renice -n ${NICELEVEL} -p $!
#fg
#pstree -ps ${cmdpid}

## function for env
# <https://unix.stackexchange.com/a/20297>

## new idea - seems to be most interesteing
#echo "$$"
# set niceness of shell to target by sudo
sudo renice -n ${NICELEVEL} -p $$
# start command (with inherited niceness) in original users context
exec "$@"
