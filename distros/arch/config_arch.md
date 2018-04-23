## Must do after fresh install

### Install softwares

```
systemctl enable dhcpcd.service   # enable wired network connection on bootup
systemctl start dhcpcd.service    # start wired network connection now
// Dev tools
pacman -S base-devel git bc xmlto docbook-xsl kmod inetutils # install core development package, e.g., make, gcc
// Utils
pacman -S git bash-completion openssh
// python2
pacman -S python2
// c/c++ tools
pacman -S ctags cscope
// To kill xserver, Ctrl+Alt+F1
pacman -S xorg-server xorg-xmodmap xorg-xinit xterm
// Install tmux-bash-completion AUR
```

### Create user account

- Create the new user account: `useradd -m USER_NAME`
- Add sudo permission to the new account:

1. First login as root
2. `visudo -f /etc/sudoers`
3. Add this line `USER_NAME ALL=(ALL) ALL`
``` 

See [this](https://wiki.archlinux.org/index.php/Users_and_groups) and [this](https://wiki.archlinux.org/index.php/sudo) doc for more details.
