#!/bin/zsh

. ./helpers.sh

# shellcheck disable=SC1090
source "$HOME/.zshrc"

log_echo "Running Ruby setup..."

RBENV_PREFIX="$HOME/.rbenv"

find_latest_ruby() {
  rbenv install -l | grep -v - | tail -1 | sed -e 's/^ *//'
}

num_rubies="$(rbenv versions --bare | wc -l)"

if [ $num_rubies -eq 0 ]; then
  ruby_version="$(find_latest_ruby)"
  log_echo "Installing Ruby ${ruby_version}..."

  # Resolve warning: "Insecure world writable dir /Users/username in PATH, mode 040777"
  # https://stackoverflow.com/a/6196644
  # chmod go-w /Users
  # chmod go-w ~

  readline_dir="--with-readline-dir=$(brew --prefix readline)"
  openssl_dir="--with-openssl-dir=$(brew --prefix openssl)"
  export RUBY_CONFIGURE_OPTS="--disable-install-doc $readline_dir $openssl_dir"
  # For more info on specifying openssl path
  # https://github.com/thoughtbot/laptop/commit/c8dca7705b5c4e272d12a903f9d65a3ae01f2498
  rbenv install -s "$ruby_version"
  rbenv global "$ruby_version"
  rbenv shell "$ruby_version"

  log_echo "Updating system gems..."
  gem update --system
  gem update

  log_echo "Resolve 'already initialized constant' warnings..."
  # https://github.com/ruby/fileutils/issues/22#issuecomment-424230668
  gem uninstall fileutils
  gem update fileutils --default

  log_echo "Installing commonly used gems..."
  gem install bundler foreman rails

  log_pass "Ruby ${ruby_version} installed."
else
  log_echo "Using Ruby $(rbenv global)."
fi
