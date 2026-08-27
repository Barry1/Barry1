#!/bin/sh
pipx install archivebox
pipx install argcomplete
pipx install asv
pipx install autopep8
pipx install bandit
pipx install beautysh
pipx install black
pipx install darker
pipx install flake8
pipx install flowmark
pipx install flynt
pipx install isort
pipx install mbake
####################################################
pipx install mdformat
pipx inject mdformat mdformat-beautysh
pipx inject mdformat mdformat-deflist
pipx inject mdformat mdformat-dollarmath
pipx inject mdformat mdformat-footnote
pipx inject mdformat mdformat-frontmatter
pipx inject mdformat mdformat-gfm
pipx inject mdformat mdformat-gfm-alerts
pipx inject mdformat mdformat-ruff
pipx inject mdformat mdformat-tables
pipx inject mdformat mdformat-toc
####################################################
pipx install monkeytype
####################################################
pipx install mypy
pipx inject mypy types-psutil
####################################################
pipx install openai-whisper
pipx install pandoc-kroki-filter
pipx install pandoc-mermaid-filter
pipx install poetry
pipx install pre-commit
pipx install pycodestyle
pipx install pydocstyle
pipx install pyflakes
pipx install pylama
pipx install pylint
pipx install pylyzer
pipx install pyperf
pipx install pyre
pipx install pyrefly
####################################################
pipx install pytest
pipx inject pytest pytest-asyncio
pipx inject pytest pytest-bandit
pipx inject pytest pytest-beartype
pipx inject pytest pytest-colordots
pipx inject pytest pytest-cov
pipx inject pytest pytest-monkeytype
pipx inject pytest pytest-mypy
pipx inject pytest pytest-pyright
pipx inject pytest pytest-sugar
pipx inject pytest typeguard
####################################################
pipx install pyright
pipx install pytype
pipx install pyupgrade
pipx install rembg
pipx install ruff
pipx install sourcery
pipx install ty
pipx install ufmt
pipx install vermin
pipx install vulture
##############################################################################################
# pipx list --include-injected
