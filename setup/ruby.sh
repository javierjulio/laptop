#!/bin/zsh
#
# Summary: Install a Ruby version using rbenv and ruby-build
#
# Usage: ./ruby.sh <version>

set -e

if [ "$#" -eq 0 ]; then
  echo "Error: Missing or invalid version."
  echo "Usage: ./ruby.sh <version>"
  exit 1
fi

# shellcheck disable=SC1090
source "$HOME/.zshrc"

log_info() {
  echo "$(date +%H:%M:%S) - $1"
}

install_ruby() {
  ruby_version="$1"
  log_info "Installing Ruby ${ruby_version}."

  # Only openssl needs to be specified as readline is taken care of
  # https://github.com/rbenv/ruby-build/issues/1421#issuecomment-602822981
  export RUBY_CONFIGURE_OPTS="--disable-install-doc --with-openssl-dir=$(brew --prefix openssl@3)"

  if rbenv install "$ruby_version"; then
    rbenv shell "$ruby_version"
    log_info "Ruby ${ruby_version} installed."
    gem update --system
    gem update
    gem install irb foreman rails
  else
    log_info "Skipped Ruby install."
  fi
}

if [ "$#" -eq 1 ]; then
  log_info "Running Ruby setup."
  install_ruby "$1"
fi
