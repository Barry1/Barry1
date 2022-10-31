#!/bin/sh
whichwaves=${1:-$(find . -iname '*.wav')}
bitrate=${2:-256KB}
time parallel ffmpeg -loglevel error -hide_banner -i {} -acodec mp3 -b:a "$bitrate" '{.}.mp3' ::: "$whichwaves"
