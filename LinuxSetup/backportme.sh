#!/bin/sh
sudo apt update
sudo apt-get build-dep "$1"
sudo apt-get -b source "$1"
for a in "$1"*.deb; do
	sudo dpkg -i "$a"
done
