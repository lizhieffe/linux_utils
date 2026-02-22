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

## 
# -----------------------------------------------------------------------------
# General Settings
# -----------------------------------------------------------------------------

# Change prefix from 'Ctrl+B' to 'Ctrl+A' (easier to reach)
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# Enable mouse control (clickable windows, panes, resizable panes)
set -g mouse on

# Start window and pane numbering at 1 (instead of 0)
set -g base-index 1
setw -g pane-base-index 1

# Automatically renumber windows when one is closed
set -g renumber-windows on

# Increase scrollback buffer size
set -g history-limit 10000

# -----------------------------------------------------------------------------
# tmux
# -----------------------------------------------------------------------------
# Fix color scheme for tmux
alias tmux='tmux -2'  # for 256color
alias tmx='tmux'
