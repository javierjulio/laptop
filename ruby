#!/usr/bin/env bash

# shellcheck disable=SC1090
source "$HOME/.profile"
reload

RBENV_PREFIX="$HOME/.rbenv"
RBENV_UPDATE_PREFIX="$HOME/.rbenv/plugins/rbenv-update"
RUBY_BUILD_PREFIX="$HOME/.rbenv/plugins/ruby-build"

if [ ! -d "$RBENV_PREFIX" ]; then
  echo -e "\nInstalling rbenv..."
  git clone https://github.com/rbenv/rbenv.git "$RBENV_PREFIX"
  reload
fi

if [ ! -d "$RBENV_UPDATE_PREFIX" ]; then
  echo -e "\nInstalling rbenv-update..."
  git clone https://github.com/rkh/rbenv-update.git "$RBENV_UPDATE_PREFIX"
else
  rbenv update
fi

find_latest_ruby() {
  rbenv install -l | grep -v - | tail -1 | sed -e 's/^ *//'
}

if [ ! -d "$RUBY_BUILD_PREFIX" ]; then
  # Resolve warning: "Insecure world writable dir /Users/username in PATH, mode 040777"
  # https://stackoverflow.com/a/6196644
  chmod go-w ~

  echo -e "\nInstalling ruby-build..."
  git clone https://github.com/rbenv/ruby-build.git "$RUBY_BUILD_PREFIX"

  ruby_version="$(find_latest_ruby)"

  eval "$(rbenv init -)"

  echo -e "\nInstalling Ruby ${ruby_version}..."

  readline_dir="--with-readline-dir=$(brew --prefix readline)"
  openssl_dir="--with-openssl-dir=$(brew --prefix openssl)"
  export RUBY_CONFIGURE_OPTS="--disable-install-doc $readline_dir $openssl_dir"
  # For more info on specifying openssl path
  # https://github.com/thoughtbot/laptop/commit/c8dca7705b5c4e272d12a903f9d65a3ae01f2498
  rbenv install -s "$ruby_version"
  rbenv global "$ruby_version"
  rbenv shell "$ruby_version"

  echo -e "\nUpdating default gems for Ruby ${ruby_version}..."
  gem update --system
  gem update

  echo -e "\nResolve 'already initialized constant' warnings..."
  # https://github.com/ruby/fileutils/issues/22#issuecomment-424230668
  gem uninstall fileutils
  gem update fileutils --default

  echo -e "\nInstalling common gems..."
  gem install bundler foreman rails
fi
