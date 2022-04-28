#!/usr/bin/sh
python3 -m pip download --python-version 3.10 --platform win_amd64 --platform none --only-binary=:all: $@
echo "If errors - try \"python3 -m pip download PCKNAME\""