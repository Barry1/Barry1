#!/bin/bash
# bash needed for pushd, popd
PYENVBIN=/home/ebeling/.pyenv/bin/pyenv
thewrkdir=$(mktemp --directory)
pushd "${thewrkdir}" >/dev/null || exit
${PYENVBIN} update
######################## if there is something to remove ###########################
#cd ~/.pyenv
#git fetch --all --tags --force
#git pull --rebase
######################## if there is something to remove ###########################
#for a in {7..13}; do echo pyenv install --skip-existing $(pyenv latest --known 3.$a) ; done
thever=5
maxver=15
while [[ ${thever} -le ${maxver} ]]; do
	# shellcheck disable=SC2312
	${PYENVBIN} install --skip-existing "$(${PYENVBIN} latest --known 3."${thever}")"
	thever=$((thever + 1))
done
popd >/dev/null || exit
rm -rf "${thewrkdir}"
