#!/bin/sh

if [ -d "$HOME/.bin" ]; then
  export PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.rbenv" ]; then
  eval "$(rbenv init -)"
fi

if [ -d "$HOME/.nodenv" ]; then
  eval "$(nodenv init -)"
fi

if [ -d "$HOME/.docker/bin" ]; then
  export PATH="$HOME/.docker/bin:$PATH"
fi

# Run `code` to open Visual Studio Code from the Terminal.
# https://code.visualstudio.com/docs/setup/mac#_launch-vs-code-from-the-command-line
if [ -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ]; then
  export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
fi
