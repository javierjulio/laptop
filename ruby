#!/usr/bin/env bash

shopt -s expand_aliases
# shellcheck disable=SC1090
source "$HOME/.profile"
reload

RBENV_PREFIX="$HOME/.rbenv"
RBENV_UPDATE_PREFIX="$HOME/.rbenv/plugins/rbenv-update"
RUBY_BUILD_PREFIX="$HOME/.rbenv/plugins/ruby-build"

if [ ! -d "$RBENV_PREFIX" ]; then
  echo -e "\nInstalling rbenv..."
  git clone https://github.com/sstephenson/rbenv.git "$RBENV_PREFIX"
  # no need to export paths as those are in my dotfiles
  reload
fi

if [ ! -d "$RBENV_UPDATE_PREFIX" ]; then
  echo -e "\nInstalling rbenv-update..."
  # use `rbenv update` to update rbenv and all installed plugins
  git clone https://github.com/rkh/rbenv-update.git "$RBENV_UPDATE_PREFIX"
fi

if [ ! -d "$RUBY_BUILD_PREFIX" ]; then
  echo -e "\nInstalling ruby-build..."
  git clone https://github.com/sstephenson/ruby-build.git "$RUBY_BUILD_PREFIX"

  echo -e "\nInstalling Ruby 2.3.1..."
  # For more info on specifying openssl path
  # https://github.com/thoughtbot/laptop/commit/c8dca7705b5c4e272d12a903f9d65a3ae01f2498
  RUBY_CONFIGURE_OPTS=--with-openssl-dir=/usr/local/opt/openssl rbenv install -s 2.3.1
  rbenv global 2.3.1
  # chown -R $RBENV_PREFIX

  echo -e "\nUpdating system and default gems for Ruby $(rbenv global) ..."
  gem update --system
  gem update

  echo -e "\nInstalling common gems..."
  gem install bundler foreman rails
fi

echo -e "\nUpdating rbenv and plugins..."
rbenv update
