#!/usr/bin/env bash

echo "Installing rbenv for managing Ruby versions ..."
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  # no need to export paths as those are in my dotfiles
  exec $SHELL -l

echo "Installing ruby-build as an rbenv plugin ..."
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo "Installing Ruby 2.1.1 ..."
  rbenv install 2.1.1
  rbenv rehash
  rbenv global 2.1.1
  # chown -R ~/.rbenv

echo "Updating RubyGems and default gems for Ruby" `rbenv global` "..."
  gem update --system
  gem update
  rbenv rehash

echo "Installing common gems ..."
  gem install bundler rake foreman sinatra serious awesome_print rails pry
  rbenv rehash
