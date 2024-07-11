#!/bin/zsh
#
# Summary: Install a Node version using nodenv and node-build
#
# Usage: ./node.sh <version>

set -e

if [ "$#" -eq 0 ]; then
  echo "Error: Missing or invalid version."
  echo "Usage: ./node.sh <version>"
  exit 1
fi

# shellcheck disable=SC1090
source "$HOME/.zshrc"

log_info() {
  echo "$(date +%H:%M:%S) - $1"
}

install_node() {
  node_version="$1"
  log_info "Installing Node ${node_version}."

  if nodenv install "$node_version"; then
    nodenv shell "$node_version"
    log_info "Node ${node_version} installed."
    npm install -g npm yarn
  else
    log_info "Skipped Node install."
  fi
}

if [ "$#" -eq 1 ]; then
  log_info "Running Node setup."
  install_node "$1"
fi
