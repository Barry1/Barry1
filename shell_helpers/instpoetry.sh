#!/bin/env bash
#https://python-poetry.org/docs/master/#installation
pyexe=$(which python3)
poetryinstallsrc=https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py
poetrygitsrc=https://github.com/python-poetry/poetry.git@master

$pyexe -m ensurepip
$pyexe -m pip install --upgrade pip

curl -sSL $poetryinstallsrc | $pyexe - --git $poetrygitsrc

poetry self update
