#!/bin/sh
sudo apt update
sudo apt install python3 python3-venv pipx
rm -rf ~/.local/share/pypoetry
rm -f ~/.local/bin/poetry
pipx ensurepath
pipx install poetry
poetry env remove --all
poetry config virtualenvs.in-project false
