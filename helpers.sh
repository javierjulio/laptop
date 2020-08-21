#!/bin/sh

_print_log() {
  if [ "$#" -eq 0 ] || [ "$#" -gt 2 ]; then
    echo "Usage: logging [<fmt>] <msg>"
    echo "Formatting Options:"
    echo "  WARN, SUCCESS"
    return 1
  fi

  printf "%s -" "$(date +%H:%M:%S)"

  case "$1" in
  WARN) # red
    printf "\033[1;31m %s \033[0m" "$2"
    ;;
  SUCCESS) # green
    printf "\033[1;32m %s \033[0m" "$2"
    ;;
  *)
    printf " %s" "$1"
    ;;
  esac

  echo
}

log_pass() {
  _print_log SUCCESS "$1"
}

log_warn() {
  _print_log WARN "$1"
}

log_info() {
  _print_log "$1"
}
