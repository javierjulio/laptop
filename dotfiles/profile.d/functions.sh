#!/bin/sh

# shellcheck disable=SC1091
reload() {
  [ -n "$ZSH_VERSION" ] && . "$HOME/.zshrc"
  [ -n "$BASH" ] && . "$HOME/.profile"
}
alias r='reload'

executable() {
  chmod +x "$@"
}

search() {
  find . -type f -print0 | xargs -0 grep -l "$1"
}

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
emptytrash() {
  sudo rm -rfv /Volumes/*/.Trashes
  sudo rm -rfv ~/.Trash
  sudo rm -rfv /private/var/log/asl/*.asl
}
