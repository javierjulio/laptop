#!/usr/bin/env bash

shopt -s expand_aliases
source ~/.bashrc
reload

if [ ! -d ~/.rbenv ]; then
  echo -e "\nInstalling rbenv..."
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  # no need to export paths as those are in my dotfiles
  reload
fi

if [ ! -d ~/.rbenv/plugins/rbenv-update ]; then
  echo -e "\nInstalling rbenv-update..."
  # use `rbenv update` to update rbenv and all installed plugins
  git clone https://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update
fi

if [ ! -d ~/.rbenv/plugins/rbenv-gem-rehash ]; then
  echo -e "\nInstalling rbenv-gem-rehash..."
  # never have to run rbenv rehash again
  git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
fi

if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
  echo -e "\nInstalling ruby-build..."
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

  echo -e "\nInstalling Ruby 2.1.1..."
  rbenv install 2.1.1
  rbenv global 2.1.1
  # chown -R ~/.rbenv

  echo -e "\nUpdating system and default gems for Ruby" `rbenv global` "..."
  gem update --system
  gem update

  echo -e "\nInstalling common gems..."
  gem install bundler rake foreman sinatra serious awesome_print rails pry
fi

echo -e "\nUpdating rbenv and all installed plugins..."
rbenv update
