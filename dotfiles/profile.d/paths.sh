#!/bin/sh

export EDITOR="code --wait"

source_file() {
  if [ -f "$1" ]; then
    # shellcheck disable=SC1090
    . "$1"
  fi
}

if [ -n "$ZSH_VERSION" ]; then
  source_file "$HOMEBREW_PREFIX/share/google-cloud-sdk/path.zsh.inc"
  source_file "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.zsh.inc"
fi

if [ -n "$BASH" ]; then
  source_file "$HOMEBREW_PREFIX/share/google-cloud-sdk/path.bash.inc"
  source_file "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.bash.inc"
fi

unset -f source_file

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
