#!/bin/zsh

. ./helpers.sh

# shellcheck disable=SC1090
source "$HOME/.zshrc"

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

  readline_dir="--with-readline-dir=$(brew --prefix readline)"
  openssl_dir="--with-openssl-dir=$(brew --prefix openssl)"
  export RUBY_CONFIGURE_OPTS="--disable-install-doc $readline_dir $openssl_dir"
  # For more info on specifying openssl path
  # https://github.com/thoughtbot/laptop/commit/c8dca7705b5c4e272d12a903f9d65a3ae01f2498
  rbenv install -s "$ruby_version"
  rbenv global "$ruby_version"
  rbenv shell "$ruby_version"

  log_info "Updating system gems..."
  gem update --system
  gem update

  log_info "Resolve 'already initialized constant' warnings..."
  # https://github.com/ruby/fileutils/issues/22#issuecomment-424230668
  gem uninstall fileutils
  gem update fileutils --default

  log_info "Installing common gems... (answer yes on overriding executables)"
  # Answer "yes" with overriding executables e.g. bundler
  gem install bundler irb foreman rails

  log_pass "Ruby ${ruby_version} installed."
else
  log_info "Using Ruby $(rbenv global)."
fi
