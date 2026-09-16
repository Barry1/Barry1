#!/bin/sh
#shfmt --write pipxes.sh
main() {
	if [ -z "$1" ]; then
		echo "No function specified. Available functions: manualinstall, export, import"
	# else run the given function only
	else
		$1
	fi
}
main "$@"

manualinstall() {
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
	pipx install mdformat; pipx inject mdformat mdformat-beautysh mdformat-deflist mdformat-dollarmath mdformat-footnote mdformat-frontmatter mdformat-gfm mdformat-gfm-alerts mdformat-ruff mdformat-tables mdformat-toc
	pipx install monkeytype
	pipx install mypy; pipx inject mypy types-psutil
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
	pipx install pyright
	pipx install pytest; pipx inject pytest pytest-asyncio pytest-bandit pytest-beartype pytest-colordots pytest-cov pytest-monkeytype pytest-mypy pytest-pyright pytest-sugar typeguard
	pipx install pytype
	pipx install pyupgrade
	pipx install rembg
	pipx install ruff
	pipx install sourcery
	pipx install ty
	pipx install ufmt
	pipx install vermin
	pipx install vulture
}

export() {
	pipx list --json >pipx_list.json
	echo "Exported pipx list to pipx_list.json"
}

import() {
	if [ -f pipx_list.json ]; then
		echo "Importing pipx list from pipx_list.json"
		pipx install-all pipx_list.json
	else
		echo "pipx_list.json not found. Please run export first."
	fi
}
