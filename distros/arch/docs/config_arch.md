## Must do after fresh install

### Create user account

1. First login as root
2. Create new user account: `useradd -m USER_NAME`
3. Create password: `passwd USER_NAME`
4. Give permission: `visudo -f /etc/sudoers` and add this line `USER_NAME ALL=(ALL) ALL`
5. Exit root login by `exit` and login as new user.

See [this](https://wiki.archlinux.org/index.php/Users_and_groups) and [this](https://wiki.archlinux.org/index.php/sudo) doc for more details.

### Install softwares

```
systemctl enable dhcpcd.service   # enable wired network connection on bootup
systemctl start dhcpcd.service    # start wired network connection now
// Dev tools
pacman -S base-devel git bc xmlto docbook-xsl kmod inetutils python2 vim # install core development package, e.g., make, gcc
// Utils
pacman -S git bash-completion openssh wget the_silver_searcher

// c/c++ tools
pacman -S ctags cscope

// gnome
sudo pacman -Syu --noconfirm gnome gnome-extra
pacman -Syyu  // Update arch
sudo systemctl enable gdm
sudo reboot

// Chrome (if gnome or other UI is installed)
1. Install google-chrome AUR
2. pacman -Syu adobe-source-han-sans-cn-fonts ttf-droid  // Chinese character
3. sudo pacman -S ttf-dejavu  // Fix the square char on Chrome URL field when displaying Chinese
4. In Chrome setting "Customize fonts" page, select "Source Han Sans CN" for all fonts.
5. Install Chinese input: https://medium.com/@slmeng/how-to-install-chinese-fonts-and-input-method-in-arch-linux-18b68d2817e7

// Install tmux-bash-completion AUR

/ *
  * fzf
  */
pacman -Syu fzf
// Add these in the .bash_profile
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

/ *
  * cscope
  */
pacman -S cscope
// Then follow the arch doc for vim+cscope to set up.

```
```
