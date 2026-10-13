#!/bin/zsh

setopt PROMPT_SUBST

autoload -Uz add-zsh-hook vcs_info
zstyle ':vcs_info:git:*' formats '(%b) '
add-zsh-hook precmd vcs_info

PS1='%F{cyan}%1~:%f %F{yellow}${vcs_info_msg_0_}%f'

# Display the time for the right prompt.
RPROMPT="%*"
