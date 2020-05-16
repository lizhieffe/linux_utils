 export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[33;1m\]\w\[\033[m\]\$ "                                                                                                                                            

export CLICOLOR=1
export LSCOLORS=gxfxaxdxcxegedabagacad

alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'

alias ls='ls -aGFh'
alias ll='ls -alGFh'

alias vi='vim'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

export PATH=$PATH:~/scripts

# Use Sublime Text as the default editor.
export EDITOR="subl -w"

# Add binaries installed via Homebrew to our PATH.
export PATH=$HOME/homebrew/bin:$HOME/development/linux_utils/scripts:$HOME/development/linux_utils/distros/arch/scripts:$PATH

# Create and enter a directory
function mkcd () { mkdir -p "$@" && cd "$@"; }

# VIM input style in bash terminal 
set -o vi

# Load more settings from .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# RPI cross-compiling toolchain. See https://www.raspberrypi.org/documentation/linux/kernel/building.md
export PATH=$PATH:$HOME/installed/rpi_toolchain/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin

alias sudo='sudo '
