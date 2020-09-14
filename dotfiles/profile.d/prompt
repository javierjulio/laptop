#!/bin/zsh

autoload -U colors
colors

setopt PROMPT_SUBST

if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion.d/git-prompt.sh"
fi

# The format is as follows if the git prompt is available.
#
#   current-directory: (git-branch-name)
#
if command -v __git_ps1 >/dev/null 2>&1; then
  export PS1='%{$fg[cyan]%}%1~: %{$fg[yellow]%}$(__git_ps1 "(%s) ")%{$reset_color%}'
else
  export PS1='%{$fg[cyan]%}%1~: '
fi

# Display the time for the right prompt.
export RPROMPT="%*"
