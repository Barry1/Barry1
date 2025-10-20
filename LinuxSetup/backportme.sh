#!/bin/sh
printf '\v\t\tBackporting package: %s\n' "$1"
echo "=============================================="
echo "Updating package lists..."
sudo apt update
echo "=============================================="
echo "Checking available versions for $1..."
rmadison "$1"
echo "=============================================="
echo "Installing build dependencies for $1..."
sudo apt-get build-dep --only-source "$1"
echo "=============================================="
echo "Building source package for $1..."
apt-get --build source "$1"
for pkg in "$1"_*.deb; do
	echo "Installing package: ${pkg}"
	sudo dpkg -i "${pkg}"
done
echo "=============================================="
echo "Backport of $1 complete."
echo "=============================================="
