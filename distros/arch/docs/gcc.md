### In Arch Linux, you can use the AUR to compile your custom version of GCC (example with gcc 4.9)
#### [Alternative 1]: using the AUR manually
```bash
mkdir -p $HOME/build/
cd $HOME/build/
git clone https://aur.archlinux.org/gcc49.git
cd gcc49
makepkg --syncdeps
sudo pacman --upgrade gcc-4.9.3-1-x86_64.pkg.tar.xz
```

#### [Alternative 2]: use one of the available [AUR helpers](https://wiki.archlinux.org/index.php/AUR_helpers):
example using [pacaur](https://wiki.archlinux.org/index.php/Pacaur) (needs to be installed previously)
```bash
pacaur -S gcc49
```

To use the newly installed compiler, you have to set the correct version in the shell you are using:
```bash
export CXX=/usr/bin/g++-4.9
```
Note: this has to be done in each new shell you use. To make it permanent, add the line above to your `~/.bashrc` file.
