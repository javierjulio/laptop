#!/bin/zsh
#
# Summary: Install a Node version using nodenv and node-build
#
# Usage: ./node.sh
#        ./node.sh <version>
#
# If no version given, then the latest version found is installed.

set -e

# shellcheck disable=SC1090
source "$HOME/.zshrc"

log_info() {
  echo "$(date +%H:%M:%S) - $1"
}

find_latest_node() {
  nodenv install --list | grep "^[[:space:]]*\d*\.\d*\.\d*" | tail -1 | sed -e 's/^ *//'
}

install_node() {
  node_version="$1"
  log_info "Installing Node ${node_version}..."
  nodenv install --skip-existing "$node_version"
  nodenv shell "$node_version"
  log_info "Node ${node_version} installed."
  log_info "Installing global npm packages..."
  npm install -g npm yarn
}

num_nodes="$(nodenv versions --bare | wc -l)"

log_info "Running Node setup."

if [ $num_nodes -eq 0 ]; then
  node_version="$(find_latest_node)"
  install_node "$node_version"
  nodenv global "$node_version"
elif [ "$#" -eq 1 ]; then
  install_node "$1"
else
  log_info "Using Node $(nodenv global) (global)"
fi
