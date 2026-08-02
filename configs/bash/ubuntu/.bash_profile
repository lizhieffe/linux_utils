# Login shells (new terminals, SSH sessions) don't read .bashrc
# automatically, so pull it in here. .bashrc holds everything (aliases,
# PS1, conda init) and does not source this file back, so there's no
# risk of a sourcing cycle.
[ -f ~/.bashrc ] && . ~/.bashrc
