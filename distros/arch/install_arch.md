Follow this doc: https://wiki.archlinux.org/index.php/installation_guide

## Tips

### Partition the disk and format partitions

I prefer to use fdisk to do the partition.

1. `fdisk /dev/sdX`
2. Create partition with 1G size, which will be used as EFI.  /dev/sdX1
3. Create partition with 8G size, which will be used as swap. /dev/sdX2
4. Create partition with the rest, which will be the linux system.  /dev/sdX3
5. Set partition 1 to EFI type: `t->1->1`
6. Set partition 2 to swap type: `t->2->19`
7. Set partition 1 to system type: `t->3->24`
8. Save and quit fdisk: `w`

After partition is done, here we go on with format.

1. `mkfs.vfat /dev/sdX1`
2. `mkswap /dev/sdX2`, `swapon /dev/sdX2`
3. `mkfs.ext4 /dev/sdX3`

### The boot option doesn't show in UEFI

Try to update the motherboard's bios.

- If it is HP machine, try to follow this doc: https://wiki.archlinux.org/index.php/HP_EliteBook_840_G1#UEFI_Setup
- For other brands, try this doc: https://wiki.archlinux.org/index.php/GRUB/EFI_examples#HP
