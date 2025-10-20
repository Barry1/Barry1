#!/bin/sh
# formatted with shfmt --posix --simplify --write THISFILE.sh
# https://docs.kernel.org/admin-guide/quickly-build-trimmed-linux.html
# https://medium.com/free-code-camp/building-and-installing-the-latest-linux-kernel-from-source-6d8df5345980
# https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Here-Documents

printhelp() {
	make help | grep "config *-"
}
gitinit() {
	# `git branch --show-current` muss "linux-rolling-stable" sein
	# `git remote get-url origin` muss "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git" sein
	# shellcheck disable=SC2312
	if [ "$(git branch --show-current)" = "linux-rolling-stable" ] && [ "$(git remote get-url origin)" = "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git" ]; then
		echo "GIT Repository und Branch korrekt konfiguriert"
	else
		echo "GIT Repository und Branch stimmt nicht, clone neu"
		git clone --branch linux-rolling-stable --single-branch https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git .
	fi
}
buildkernel() {
	echo ===============================================
	# LMC_KEEP="fs/cifs,net/iwlwifi"
	make "$1" x86_64_defconfig rust.config
	# make headers
	# make headers_install
	echo "-basti_$1" >localversion
	cat localversion
	time nice -n 20 make --jobs=$((2 * $(getconf _NPROCESSORS_ONLN))) --load-average=$(getconf _NPROCESSORS_ONLN) V=12
	sudo sh -c command -v installkernel && sudo make modules_install install
	echo ===============================================
}
systempkginit() {
	sudo apt install git bc bison flex libssl-dev dwarves libncurses-dev pahole
	# for rust
	sudo apt install bindgen rust-src
}
systemprep() {
	ls /autofsmnt/Fotos >/dev/null &
	echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
	export KCFLAGS="-march=native -O3 -pipe"
	export KCPPFLAGS="-march=native -O3 -pipe"
	git pull
}
regularrun() {
	gitinit
	systemprep
	for a in localmodconfig defconfig allmodconfig tinyconfig; do
		buildkernel "${a}"
	done
}
############################################################################################################################
case $1 in
h | H | help | Help) printhelp ;;
syspkginit) systempkginit ;;
*) regularrun ;;
esac
