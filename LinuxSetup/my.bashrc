#!/bin/bash
# `shellcheck` is running fine
# `shfmt --language-dialect bash --simplify --write my.bashrc` is running fine
### find wrapper to exclude venv and tox directories
find() {
	start=${1:-.}
	shift 2>/dev/null
	command find "$start" -not -path \*venv\* -not -path \*tox\* "$@"
}
### my own binary path
export PATH="/home/ebeling/.local/bin:$PATH"
### zoxide
### pyenv
if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init - bash)"
fi
### poetry
### inxi / info -F
### fastfetch (neofetch/screenfetch alternative)
# https://github.com/fastfetch-cli/fastfetch/wiki/Support+Status#available-modules
# fastfetch -c all.jsonc
# fastfetch --stat
fastfetch
