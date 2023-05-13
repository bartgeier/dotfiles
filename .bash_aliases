#!/bin/bash

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias cd~='cd ~'
alias cd-='cd -'
alias cd..='cd ..'
alias cd.='cd ~'
alias .='cd ~' #bash: cd: too many arguments => because . is synonym for the source command
alias .-='cd -'
alias ..='cd ..'

alias vim=nvim
alias jf="cd ~ && cd \$(fzf | xargs dirname) && ls -alF" # jump to directory where the file is
alias jd="cd ~ && cd \$(find * -type d | fzf) && ls -alF" # search and jump to directory
alias js="cd ~ && cd \$(find * -type d | fzf); bash $HOME/scripts/tmux-sessionizer && ls -alF "  #search and jump to tmux session
