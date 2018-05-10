# Must do after fresh install

## Install softwares

```
systemctl enable dhcpcd.service   # enable wired network connection on bootup
systemctl start dhcpcd.service    # start wired network connection now
// Dev tools
pacman -S base-devel git bc xmlto docbook-xsl kmod inetutils python2 vim  // install core development package, e.g., make, gcc
// Utils
pacman -S git bash-completion openssh wget the_silver_searcher
// Install AUR vundle-git

// c/c++ tools
pacman -S ctags cscope

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

// Install tmux-bash-completion AUR
```

## Create user account

1. First login as root
2. Create new user account: `useradd -m USER_NAME`
3. Create password: `passwd USER_NAME`
4. Give permission: `visudo -f /etc/sudoers` and add this line `USER_NAME ALL=(ALL) ALL`
5. Exit root login by `exit` and login as new user.

See [this](https://wiki.archlinux.org/index.php/Users_and_groups) and [this](https://wiki.archlinux.org/index.php/sudo) doc for more details.

## Install Desktop

### Option 1: LXDE (lightweight)

```
sudo pacman -Syu lxde lxdm
sudo systemctl enable lxdm
sudo sed -i /etc/lxdm/lxdm.conf -e 's;^# session=/usr/bin/startlxde;session=/usr/bin/startlxde;g'
sudo pacman -Syu ttf-libertion  // Fix problem that the char in terminal overlap
sudo reboot
```

After reboot, in the terminal preference, use any "monospace" font.

### Option 2: GNOME

```sudo pacman -Syu --noconfirm gnome gnome-extra
pacman -Syyu  // Update arch
sudo systemctl enable gdm
sudo reboot
```

Open preference for terminal, in the existing profile, in Command tab, check "Run command as a login shell", so that the .bash_profile will be loaded when opening new terminal.

### Desktop Apps

#### Chrome 

1. Install google-chrome AUR
2. pacman -Syu adobe-source-han-sans-cn-fonts ttf-droid  // Chinese character
3. sudo pacman -S ttf-dejavu  // Fix the square char on Chrome URL field when displaying Chinese
4. In Chrome setting "Customize fonts" page, select "Source Han Sans CN" for all fonts.

// gnome Chinese Input
1. sudo pacman -Syu fcitx fcitx-googlepinyin fcitx-im fcitx-configtool
2. Edit ~/.xprofile
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
3. Logout and then login
4. Launch Fcitx Config GUI from contrl center, add Google Pinyin.
5. Enjoy (Ctrl + Space is to switch input)


// gnome AndroidStudio
1. Install android-studio AUR
2. pacman -Syu android-tools android-udev  // adb and other tools
3. The AndroidStudio has SDK manager to automatically download SDK API for you.
