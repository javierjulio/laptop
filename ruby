#!/usr/bin/env bash

shopt -s expand_aliases
source $HOME/.bashrc
reload

RBENV_PREFIX="$HOME/.rbenv"
RBENV_UPDATE_PREFIX="$HOME/.rbenv/plugins/rbenv-update"
RBENV_GEM_REHASH_PREFIX="$HOME/.rbenv/plugins/rbenv-gem-rehash"
RUBY_BUILD_PREFIX="$HOME/.rbenv/plugins/ruby-build"

if [ ! -d $RBENV_PREFIX ]; then
  echo -e "\nInstalling rbenv..."
  git clone https://github.com/sstephenson/rbenv.git $RBENV_PREFIX
  # no need to export paths as those are in my dotfiles
  reload
fi

if [ ! -d $RBENV_UPDATE_PREFIX ]; then
  echo -e "\nInstalling rbenv-update..."
  # use `rbenv update` to update rbenv and all installed plugins
  git clone https://github.com/rkh/rbenv-update.git $RBENV_UPDATE_PREFIX
fi

if [ ! -d $RBENV_GEM_REHASH_PREFIX ]; then
  echo -e "\nInstalling rbenv-gem-rehash..."
  # never have to run rbenv rehash again
  git clone https://github.com/sstephenson/rbenv-gem-rehash.git $RBENV_GEM_REHASH_PREFIX
fi

if [ ! -d $RUBY_BUILD_PREFIX ]; then
  echo -e "\nInstalling ruby-build..."
  git clone https://github.com/sstephenson/ruby-build.git $RUBY_BUILD_PREFIX

  echo -e "\nInstalling Ruby 2.1.4..."
  rbenv install 2.1.4
  rbenv global 2.1.4
  # chown -R $RBENV_PREFIX

  echo -e "\nUpdating system and default gems for Ruby" `rbenv global` "..."
  gem update --system
  gem update

  echo -e "\nInstalling common gems..."
  gem install bundler rake foreman sinatra serious awesome_print rails pry
fi

echo -e "\nUpdating rbenv and all installed plugins..."
rbenv update
