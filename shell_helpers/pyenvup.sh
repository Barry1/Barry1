#!/bin/bash
# bash needed for pushd, popd
PYENVBIN=/home/ebeling/.pyenv/bin/pyenv
thewrkdir=$(mktemp --directory)
pushd "${thewrkdir}" >/dev/null || exit
${PYENVBIN} update
######################## if there is something removek ###########################
#cd ~/.pyenv
#git fetch --all --tags --force
#git pull --rebase
######################## if there is something removek ###########################
#for a in {7..13}; do echo pyenv install --skip-existing $(pyenv latest --known 3.$a) ; done
minver=5
maxver=15
while [[ ${minver} -le ${maxver} ]]; do
	# shellcheck disable=SC2312
	${PYENVBIN} install --skip-existing "$(${PYENVBIN} latest --known 3."${minver}")"
	minver=$((minver + 1))
done
popd >/dev/null || exit
rm -rf "${thewrkdir}"
