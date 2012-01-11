echo "Installing rbenv for managing Rubies ..."
  git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
  echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
  exec $SHELL

echo "Installing ruby-build to complete and install different versions of Ruby ..."
  git clone git://github.com/sstephenson/ruby-build.git ~/.ruby-build-source
  export PREFIX=~/.ruby-build
  ~/.ruby-build-source/install.sh

# if we upgrade to 1.9.3 have to make sure GCC is installed
echo "Installing Ruby 1.9.2 ..."
  rbenv install 1.9.2-p290
  rbenv rehash
  rbenv global 1.9.2-p290
  # chown -R ~/.rbenv

echo "Updating RubyGems and default gems for Ruby" `rbenv global` "..."
  gem update --system
  gem update

echo "Installing Bundler ..."
  gem install bundler

echo "Installing Rails to write and run web applications ..."
  gem install rails --no-rdoc --no-ri

echo "Installing Serious gem ..."
  gem serious
