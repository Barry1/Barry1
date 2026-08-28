#!/bin/bash
# shellcheck shell=bash
# `shellcheck` is running fine
# `shfmt --language-dialect bash --simplify --write my.bashrc` is running fine
# `beautysh -f my.bashrc` is running fine
### setting vs code as the editor
# uses vscode for GUI-EDITORS - for example also in sudoedit
if command -v code 1>/dev/null 2>&1
then
    export VISUAL="code --wait"
    export EDITOR='code --wait'
fi
### find wrapper to exclude venv and tox directories
find() {
    start=${1:-.}
    shift 2>/dev/null
    command find "$start" -not -path \*venv\* -not -path \*tox\* "$@"
}
### my own binary path
export PATH="/home/ebeling/.local/bin:$PATH"
### zoxide
command -v zoxide 1>/dev/null 2>&1 && eval "$(zoxide init bash)"
### pyenv
command -v pyenv 1>/dev/null 2>&1 && eval "$(pyenv init - bash)"
### poetry
# poetry completions bash | sudo tee /etc/bash_completion.d/poetry.bash-completion > /dev/null
### glow
# glow completion bash | sudo tee /etc/bash_completion.d/glow.bash-completion > /dev/null
# wttr.in
# https://wttr.in/:help
# curl http://de.wttr.in/Klein+Nordende
# https://wttr.in/:bash.function - this is a bash function that can be sourced in .bashrc to get the weather in the terminal
# WTTR_PARAMS is space-separated URL parameters, many of which are single characters that can be
# lumped together. For example, "F q m" behaves the same as "Fqm".
if [[ -z $WTTR_PARAMS ]]; then
    # Form localized URL parameters for curl
    if [[ -t 1 ]] && [[ "$(tput cols)" -lt 125 ]]; then
        WTTR_PARAMS+='n'
    fi 2>/dev/null
    for _token in $(locale LC_MEASUREMENT); do
        case $_token in
            1) WTTR_PARAMS+='m' ;;
            2) WTTR_PARAMS+='u' ;;
        esac
    done 2>/dev/null
    unset _token
    export WTTR_PARAMS
fi

wttr() {
    local location="${1// /+}"
    test "$#" -gt 0 && shift
    local args=()
    for p in $WTTR_PARAMS "$@"; do
        args+=("--data-urlencode" "$p")
    done
    curl --fail --get --show-error --silent -H "Accept-Language: ${LANG%_*}" "${args[@]}" --compressed "de.wttr.in/${location}"
}
if [ -z "${VSCODE_INJECTION}" ]
then
    ### inxi / inxi -F
    inxi
    ### fastfetch (neofetch/screenfetch alternative) https://itsfoss.com/neofetch-alternatives/
    # https://github.com/fastfetch-cli/fastfetch/wiki/Support+Status#available-modules
    # fastfetch -c all.jsonc
    # fastfetch --stat
    # fastfetch --weather-location Klein+Nordende --weather-timeout 100 --gen-config-force
    fastfetch
    wttr "Klein Nordende"
fi

make() {
    local GLOBAL_MK="$HOME/.Makefile"
    # Falls keine globale Datei existiert, verhalte dich wie das Original-make
    if [ ! -f "$GLOBAL_MK" ]; then
        command make "$@"
        return
    fi
    # Prüfen, ob bereits ein -f übergeben wurde
    if [[ $* == *"-f "* ]]; then
        # Füge die globalen Regeln einfach vorne an
        command make -f "$GLOBAL_MK" "$@"
    else
        # Suche nach dem lokalen Standard-Makefile
        local LOCAL=""
        for f in GNUmakefile makefile Makefile; do
            if [ -f "$f" ]; then
                LOCAL="$f"
                break
            fi
        done
        if [ -n "$LOCAL" ]; then
            # Nutze globale Regeln UND das gefundene lokale Makefile
            command make -f "$GLOBAL_MK" -f "$LOCAL" "$@"
        else
            # Kein lokales Makefile gefunden -> nur globale Regeln nutzen
            command make -f "$GLOBAL_MK" "$@"
        fi
    fi
}
command -v pandoc 1>/dev/null 2>&1 && eval "$(pandoc --bash-completion)"
source $(which env_parallel.bash)
