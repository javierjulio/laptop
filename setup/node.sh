#!/bin/zsh

# shellcheck disable=SC1090
source "$HOME/.zshrc"

log_info() {
  echo "$(date +%H:%M:%S) - $1"
}

log_info "Running Node setup..."

find_latest_node() {
  nodenv install -l | grep "^[[:space:]]*\d*\.\d*\.\d*" | tail -1 | sed -e 's/^ *//'
}

num_nodes="$(nodenv versions --bare | wc -l)"

if [ $num_nodes -eq 0 ]; then
  node_version="$(find_latest_node)"
  log_info "Installing Node ${node_version}..."

  nodenv install -s "$node_version"
  nodenv global "$node_version"
  nodenv shell "$node_version"

  log_info "Installing common packages..."
  npm install -g npm localtunnel parcel

  log_info "Node ${node_version} installed."
else
  log_info "Using Node $(nodenv global)."
fi
