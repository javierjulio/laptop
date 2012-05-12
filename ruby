echo "Installing rbenv for managing Ruby versions ..."
  git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
  # we'll set the paths for now but won't matter as we have the 
  # same ones already set in my dotfiles
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
  echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
  exec $SHELL

echo "Installing ruby-build as an rbenv plugin ..."
  mkdir -p ~/.rbenv/plugins
  cd ~/.rbenv/plugins
  git clone git://github.com/sstephenson/ruby-build.git
  cd ~/

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
  rbenv rehash

echo "Installing Rake ..."
  gem install rake
  rbenv rehash

echo "Installing Rails to write and run web applications ..."
  gem install rails --no-rdoc --no-ri

echo "Installing Sinatra ..."
  gem install sinatra

echo "Installing Serious gem ..."
  gem install serious

echo "Installing Awesome Print gem for pretty print debugging ..."
  gem install awesome_print
