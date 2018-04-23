#!/bin/bash

xmodmap -e "keycode 9 = grave asciitilde"
xmodmap -e "keycode 49 = Escape Escape"

xmodmap -e "keycode 22 = backslash bar"
xmodmap -e "keycode 51 = BackSpace BackSpace"

xmodmap -pke > ~/.xmodmap
