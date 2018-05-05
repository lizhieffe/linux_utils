Follow this doc: https://wiki.archlinux.org/index.php/installation_guide

## Tips

### Partition the disk and format partitions

I prefer to use fdisk to do the partition.

1. `fdisk /dev/sdX`
2. 'g' to treate a new empty GPT partition table
3. Create partition with 1G size, which will be used as EFI.  /dev/sdX1
4. Create partition with 8G size, which will be used as swap. /dev/sdX2
5. Create partition with the rest, which will be the linux system.  /dev/sdX3
6. Set partition 1 to EFI type: `t->1->1`
7. Set partition 2 to swap type: `t->2->19`
8. Set partition 1 to system type: `t->3->24`
9. Save and quit fdisk: `w`

After partition is done, here we go on with format.

1. `mkfs.vfat /dev/sdX1`
2. `mkswap /dev/sdX2`, `swapon /dev/sdX2`
3. `mkfs.ext4 /dev/sdX3`

### Install Arch as Dual System with another Linux Distro

Here we talk about Ubuntu+Arch
1. Install Ubuntu first. We would like to use Ubuntu's grub to manage Arch. (It is illegal to have 2 grub installed on one machine).
2. Follow the regular steps to install Arch. Skip the step to install grub.
3. Don't restart after Arch install finishes.
4. `exit` to quit the Arch root.
5. `fdisk -l` and find the disk have Ubuntu install.
6. `mount /dev/sdXN /mnt` and `arch-chroot /mnt` to root to Ubuntu install disk.
7. `export PATH="/bin:/usr/sbin:$PATH"`
8. `update-grub`
9. `exit`
10. Reboot your system and the dual system should be ready.

Alternative:
After step 3, reboot system to Ubuntun, and run `sudo update-grub`.

### The boot option doesn't show in UEFI

Try to update the motherboard's bios.

- If it is HP machine, try to follow this doc: https://wiki.archlinux.org/index.php/HP_EliteBook_840_G1#UEFI_Setup
- For other brands, try this doc: https://wiki.archlinux.org/index.php/GRUB/EFI_examples#HP
