#!/bin/sh

export HISTSIZE="20000" # Number of lines kept in session history
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST="${HISTSIZE}" # Number of lines saved in history after logout

# Use standard ISO 8601 timestamp.
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
alias h="history -t '%F %T ' 1"

# Run with search term e.g. `hs yarn` for highlighted output.
alias hs="h | grep --color=auto"

# List commands used ordered by highest frequency.
# Optional parameter to adjust number listed. Default is 30.
hstats() {
  history 1 |
    cat |
    awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a; }' |
    grep -v "./" |
    column -c3 -s " " -t |
    sort -nr |
    nl |
    head -n "${1:-30}"
}
