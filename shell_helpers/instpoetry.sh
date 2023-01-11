#!/usr/bin/env bash
#https://python-poetry.org/docs/master/#installation
sudo apt install python3-venv
pyexe=$(which python3)
#poetryinstallsrc=https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py
poetryinstallsrc=https://install.python-poetry.org/
poetrygitsrc=https://github.com/python-poetry/poetry.git@master

#not needed
#$pyexe -m ensurepip
#$pyexe -m pip install --upgrade pip

curl -sSL $poetryinstallsrc | $pyexe - --git $poetrygitsrc --force --yes

export PATH="/home/ebeling/.local/bin:$PATH"

poetry self update

#poetry cache clear PyPI --all
