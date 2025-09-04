#!/bin/sh
pyenv update
#for a in {7..13}; do echo pyenv install --skip-existing $(pyenv latest --known 3.$a) ; done
a=7
while [ $a -le 13 ]; do
	pyenv install --skip-existing "$(pyenv latest --known 3.$a)"
	a=$((a + 1))
done
