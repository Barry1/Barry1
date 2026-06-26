#!/bin/sh
# https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/shell/scripting/control-flow/status-check.html
set -i
TEMP_DEB="$(mktemp)"
wget -O "$TEMP_DEB" $1
apt install "$TEMP_DEB"
#dpkg -i "$TEMP_DEB"
#apt-get install -f
rm -f "$TEMP_DEB"

