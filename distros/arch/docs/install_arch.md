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

### The boot option doesn't show in UEFI

Try to update the motherboard's bios.

- If it is HP machine, try to follow this doc: https://wiki.archlinux.org/index.php/HP_EliteBook_840_G1#UEFI_Setup
- For other brands, try this doc: https://wiki.archlinux.org/index.php/GRUB/EFI_examples#HP
