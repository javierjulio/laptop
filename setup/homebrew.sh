#!/bin/sh

log_info() {
  echo "$(date +%H:%M:%S) - $1"
}

if command -v brew >/dev/null 2>&1; then
  log_info "Updating Homebrew..."
  brew update
else
  log_info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

log_info "Running Brew bundler..."
brew bundle --no-upgrade
brew bundle --file=Caskfile
