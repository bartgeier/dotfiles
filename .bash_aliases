
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
alias sd="cd ~ && cd \$(find * -type d | fzf)" # search and jump to directory
