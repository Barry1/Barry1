#!/bin/bash
# bash needed for pushd, popd
PYENVBIN=/home/ebeling/.pyenv/bin/pyenv
thewrkdir=$(mktemp --directory)
pushd "${thewrkdir}" >/dev/null || exit
${PYENVBIN} update
#for a in {7..13}; do echo pyenv install --skip-existing $(pyenv latest --known 3.$a) ; done
a=5
while [[ ${a} -le 14 ]]; do
	# shellcheck disable=SC2312
	${PYENVBIN} install --skip-existing "$(${PYENVBIN} latest --known 3."${a}")"
	a=$((a + 1))
done
popd >/dev/null || exit
rm -rf "${thewrkdir}"
