#!/bin/sh
# $* and $@ deliver all arguments
# for further explanation see
# <https://stackoverflow.com/a/28099707/207661>
# or <http://wiki.bash-hackers.org/scripting/posparams>

# <https://linux-tips.com/t/how-to-use-chrt-command/268>

# POLICY default RoundRobin
# POLICY=--rr # RoundRobin
# POLICY=--fifo

# shellcheck disable=SC2086
sudo chrt --all-tasks $POLICY --pid 99 $$
chrt --verbose --pid $$
# start command (with inherited prio) in original users context
exec "$@"
