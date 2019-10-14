#!/bin/sh

log_timestamp() {
  printf "\033[1;35m%s \033[0m" "$(date +%H:%M:%S)"
}

logging() {
  if [ "$#" -eq 0 ] || [ "$#" -gt 2 ]; then
    echo "Usage: logging <fmt> <msg>"
    echo "Formatting Options:"
    echo "  TITLE, WARN, INFO, SUCCESS"
    return 1
  fi

  log_timestamp

  case "$1" in
  TITLE) # yellow
    printf "\033[1;33m %s \033[0m" "$2"
    ;;
  WARN) # red
    printf "\033[1;31m %s \033[0m" "$2"
    ;;
  INFO) # blue
    printf "\033[1;34m %s \033[0m" "$2"
    ;;
  SUCCESS) # green
    printf "\033[1;32m %s \033[0m" "$2"
    ;;
  *) # blue
    printf "\033[1;34m %s \033[0m" "$1"
    ;;
  esac
  echo
}

log_pass() {
  logging SUCCESS "$1"
}

log_warn() {
  logging WARN "$1"
}

log_info() {
  logging TITLE "$1"
}

log_echo() {
  logging INFO "$1"
}
