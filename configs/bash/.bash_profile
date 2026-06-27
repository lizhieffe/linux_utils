export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[33;1m\]\w\[\033[m\]\$ "

source ~/.shell_common

# VIM input style in bash terminal
set -o vi

# Load more settings from .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
