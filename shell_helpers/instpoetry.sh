#!/usr/bin/env bash
#<https://python-poetry.org/docs/main/#installing-with-the-official-installer>
#sudo apt install python3-venv
#rm -rf ~/.local/share/pypoetry/ ~/.local/bin/poetry
if [ "$(which pyenv)" ]; then
	eval "$(pyenv init -)"
	pyenv shell 3.10
	pyexe=$(pyenv which python3)
else
	pyexe=$(which python3)
fi

echo Using python from "$pyexe"
poetryinstallsrc=https://install.python-poetry.org/
curl -sSL $poetryinstallsrc | "$pyexe" - --force --yes

#poetrygitsrc=https://github.com/python-poetry/poetry.git@main
#curl -sSL $poetryinstallsrc | $pyexe - --git $poetrygitsrc --force --yes

export PATH="/home/ebeling/.local/bin:$PATH"

#poetry self update

#poetry cache clear PyPI --all
