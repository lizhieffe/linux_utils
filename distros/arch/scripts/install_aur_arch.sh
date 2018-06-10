#/bin/sh

BASE_DIR="~/source"
# Create dir if not exist.
mkdir -p "$BASE_DIR"

cd "$BASE_DIR" 
git clone https://aur.archlinux.org/"$1".git
cd "$1"
makepkg -sic

cd "$BASE_DIR" 
rm -rf "$1"
