#!/bin/bash
# $* and $@ deliver all arguments
# for further explanation see
# <https://stackoverflow.com/a/28099707/207661>
# or <http://wiki.bash-hackers.org/scripting/posparams>
NICEADJUSTMENT=-7
sudo nice --adjustment=$NICEADJUSTMENT runuser -u "$USER" "$@"
