#!/bin/sh

# Inspired by doc: http://cscope.sourceforge.net/large_projects.html

LNX="$HOME"/development/linux
cd "$LNX"

if [[ ! -e "$LNX"/cscope.files ]]; then
  touch "$LNX"/cscope.files
fi

find  "$LNX"                                                             \
  -path "$LNX/arch/*" ! -path "$LNX/arch/i386*" -prune -o               \
  -path "$LNX/include/asm-*" ! -path "$LNX/include/asm-i386*" -prune -o \
  -path "$LNX/tmp*" -prune -o                                           \
  -path "$LNX/Documentation*" -prune -o                                 \
  -path "$LNX/scripts*" -prune -o                                       \
  -path "$LNX/drivers*" -prune -o                                       \
  -name "*.[chxsS]" -print >"$LNX"/cscope.files

cscope -b -q -k
