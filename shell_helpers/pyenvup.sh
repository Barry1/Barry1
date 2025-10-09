#!/bin/sh
pyenv update
#for a in {7..13}; do echo pyenv install --skip-existing $(pyenv latest --known 3.$a) ; done
a=5
while [ "${a}" -le 14 ]; do
	# shellcheck disable=SC2312
	pyenv install --skip-existing "$(pyenv latest --known 3."${a}")"
	a=$((a + 1))
done
