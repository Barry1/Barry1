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

# Usage: ./backportme.sh <package-name>
# Example: ./backportme.sh curl
# Note: Ensure you have the necessary permissions and that rmadison is installed.
# Note: This script assumes you are running it in a Debian-based system with sudo privileges.
# Note: You may need to run this script in a directory where you have write permissions.
# Note: You may need to install 'devscripts' package to use 'rmadison' command.
# ./backportme.sh libyyjson0
# ./backportme.sh fastfetch
# mk-build-deps fastfetch
# mk-build-deps --install --root-cmd sudo --remove
# sudo dpkg -i fastfetch-build-deps_*.deb
# sudo apt-get purge --auto-remove [package_name]-build-deps
# https://serverfault.com/questions/127625

onedriveinst() {
	repo="https://salsa.debian.org/debian/onedrive.git"
	dir="$(basename "$repo" .git)"

	if [ -z "$repo" ]; then
		printf 'No repository specified\n'
		return 1
	fi

	if [ -d "$dir" ]; then
		printf 'Directory %s exists, pulling latest changes\n' "$dir"
		(cd "$dir" && git pull --ff-only) || return 1
	else
		git clone "$repo" || return 1
	fi

	# ./configure.sh || return 1
	(cd "$dir" && debuild -us -uc -b) || return 1
	(cd "$dir" && dpkg-buildpackage --unsigned-source --unsigned-changes --build=binary --root-command=sudo) || return 1
}
