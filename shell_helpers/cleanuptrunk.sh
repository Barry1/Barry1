#!/bin/sh
#/home/ebeling/.cache/trunk/cli/1.6.0-linux-x86_64/trunk
#killall --verbose --exact --user "$(whoami)" --wait --regex "/home/ebeling/.*/trunk" "/home/ebeling/.*/crashpad_handler"
killall --verbose --exact --user "$(whoami)" --wait trunk crashpad_handler
