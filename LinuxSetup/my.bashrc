#!/bin/bash
# shellcheck shell=bash
# `shellcheck` is running fine
# `shfmt --language-dialect bash --simplify --write my.bashrc` is running fine
### setting vs code as the editor
export EDITOR='code --wait'
### find wrapper to exclude venv and tox directories
find() {
	start=${1:-.}
	shift 2>/dev/null
	command find "$start" -not -path \*venv\* -not -path \*tox\* "$@"
}
### my own binary path
export PATH="/home/ebeling/.local/bin:$PATH"
### zoxide
eval "$(zoxide init bash)"
### pyenv
if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init - bash)"
fi
### poetry
# poetry completions bash | sudo tee /etc/bash_completion.d/poetry.bash-completion > /dev/null
### glow
# glow completion bash | sudo tee /etc/bash_completion.d/glow.bash-completion > /dev/null
### inxi / inxi -F
inxi
### fastfetch (neofetch/screenfetch alternative) https://itsfoss.com/neofetch-alternatives/
# https://github.com/fastfetch-cli/fastfetch/wiki/Support+Status#available-modules
# fastfetch -c all.jsonc
# fastfetch --stat
fastfetch
