#!/bin/sh
outpufilename=${3:-${1%.pdf}_unlocked.pdf}
echo pdftk "$1" input_pw "$2" output "$outpufilename"
