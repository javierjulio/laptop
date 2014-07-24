#!/usr/bin/env bash

shopt -s expand_aliases
source ~/.bashrc
reload

if [ -d ~/.rbenv ]; then
  echo -e "\nUpdating rbenv..."
  cd ~/.rbenv
  git pull
else
  echo -e "\nInstalling rbenv..."
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  # no need to export paths as those are in my dotfiles
  reload
fi

if [ -d ~/.rbenv ]; then
  echo -e "\nUpdating ruby-build..."
  cd ~/.rbenv/plugins/ruby-build
  git pull
else
  echo -e "\nInstalling ruby-build..."
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

  echo -e "\nInstalling Ruby 2.1.1..."
  rbenv install 2.1.1
  rbenv rehash
  rbenv global 2.1.1
  # chown -R ~/.rbenv

  echo -e "\nUpdating system and default gems for Ruby" `rbenv global` "..."
  gem update --system
  gem update
  rbenv rehash

  echo -e "\nInstalling common gems..."
  gem install bundler rake foreman sinatra serious awesome_print rails pry
  rbenv rehash
fi
