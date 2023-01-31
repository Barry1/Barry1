#!/bin/sh
/usr/bin/pdftoppm -png "$1" "${1%.pdf}"
