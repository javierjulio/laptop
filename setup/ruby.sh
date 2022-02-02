#!/bin/zsh

# shellcheck disable=SC1090
source "$HOME/.zshrc"

log_info() {
  echo "$(date +%H:%M:%S) - $1"
}

log_info "Running Ruby setup..."

find_latest_ruby() {
  rbenv install --list-all | grep -v - | tail -1 | sed -e 's/^ *//'
}

num_rubies="$(rbenv versions --bare | wc -l)"

if [ $num_rubies -eq 0 ]; then
  ruby_version="$(find_latest_ruby)"
  log_info "Installing Ruby ${ruby_version}..."

  # Resolve warning: "Insecure world writable dir /Users/username in PATH, mode 040777"
  # https://stackoverflow.com/a/6196644
  # chmod go-w /Users
  # chmod go-w ~

  # Only openssl needs to be specified as readline is taken care of
  # https://github.com/rbenv/ruby-build/issues/1421#issuecomment-602822981
  export RUBY_CONFIGURE_OPTS="--disable-install-doc --with-openssl-dir=$(brew --prefix openssl@1.1)"
  rbenv install -s "$ruby_version"
  rbenv global "$ruby_version"
  rbenv shell "$ruby_version"

  log_info "Updating system gems..."
  gem update --system
  gem update

  log_info "Resolve 'already initialized constant' warnings..."
  # https://github.com/ruby/fileutils/issues/22#issuecomment-424230668
  gem uninstall fileutils mutex_m
  gem update fileutils mutex_m --default

  log_info "Installing common gems... (answer yes on overriding executables)"
  # Answer "yes" with overriding executables e.g. bundler
  gem install bundler irb foreman rails

  log_info "Ruby ${ruby_version} installed."
else
  log_info "Using Ruby $(rbenv global)."
fi
