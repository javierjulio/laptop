#!/bin/zsh
#
# Summary: Install a Ruby version using rbenv and ruby-build
#
# Usage: ./ruby.sh
#        ./ruby.sh <version>
#
# If no version given, then the latest version found is installed.

set -e

# shellcheck disable=SC1090
source "$HOME/.zshrc"

log_info() {
  echo "$(date +%H:%M:%S) - $1"
}

find_latest_ruby() {
  rbenv install --list | grep --invert-match - | tail -1 | sed -e 's/^ *//'
}

install_ruby() {
  ruby_version="$1"
  log_info "Installing Ruby ${ruby_version}..."
  # Only openssl needs to be specified as readline is taken care of
  # https://github.com/rbenv/ruby-build/issues/1421#issuecomment-602822981
  export RUBY_CONFIGURE_OPTS="--disable-install-doc --with-openssl-dir=$(brew --prefix openssl@1.1)"
  rbenv install --skip-existing "$ruby_version"
  rbenv shell "$ruby_version"
  log_info "Ruby ${ruby_version} installed."
  log_info "Updating system gems..."
  gem update --system
  gem update
  log_info "Installing common gems... (answer yes on overriding executables)"
  gem install irb foreman rails
}

num_rubies="$(rbenv versions --bare | wc -l)"

log_info "Running Ruby setup."

if [ $num_rubies -eq 0 ]; then
  ruby_version="$(find_latest_ruby)"
  install_ruby "$ruby_version"
  rbenv global "$ruby_version"
elif [ "$#" -eq 1 ]; then
  install_ruby "$1"
else
  log_info "Ruby $(rbenv global) (global) already installed."
fi
