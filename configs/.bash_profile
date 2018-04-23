export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad
export LSCOLORS=gxfxaxdxcxegedabagacad

alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'

alias ls='ls -aGFh'
alias ll='ls -alGFh'

alias vi='vim'

export PATH=$PATH:~/scripts

# Use Sublime Text as the default editor.
export EDITOR="subl -w"

# Add binaries installed via Homebrew to our PATH.
export PATH=$HOME/homebrew/bin:$PATH

# Create and enter a directory
function mkcd () { mkdir -p "$@" && cd "$@"; }

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# VIM input style in bash terminal 
set -o vi

# Load more settings from .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
