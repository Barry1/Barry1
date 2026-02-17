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
### poetry
### inxi / info -F
### fastfetch (neofetch/screenfetch alternative)
# https://github.com/fastfetch-cli/fastfetch/wiki/Support+Status#available-modules
# fastfetch -c all.jsonc
# fastfetch --stat
fastfetch
