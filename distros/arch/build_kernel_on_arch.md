1. Config arch after first installation
Follow the doc config_arch.md

2. Download souce code

```
git clone https://github.com/torvalds/linux.git
cd linux
git checkout v4.15  # change to the desired version of kernel
```

3. Create config file for compilation

To create a default config, run

```
rm .config
zcat /proc/config.gz > .config
```

To create a config fit your local machine's spec, run the following command. But
make sure to plug in all devices that you expect to use on the system if using
this method.

```
make localmodconfig
```

4. Set up environment

```
KERNEL_NAME="linux-custom"
CORES=`getconf _NPROCESSORS_ONLN`
```

5. Compile the kernel

```
# Clean the build if necessary
make clean

# Compile using all cores and set a customized name to the generated binary.
make -j "$CORES" LOCALVERSION=-"$KERNEL_NAME"
```

6. Compile the modules

```
make modules_install -j "$CORES" LOCALVERSION=-"$KERNEL_NAME"
```

7. Copy the kernel to /boot directory

```
cp -v arch/x86_64/boot/bzImage /boot/vmlinuz-"$KERNEL_NAME"
```

8. Make initial RAM disk

- Copy the existing preset file

```
cp /etc/mkinitcpio.d/linux.preset /etc/mkinitcpio.d/"$KERNEL_NAME".preset
```

- Edit the copied preset file

```
...
ALL_kver="/boot/vmlinuz-[KERNEL_NAME]"
...
default_image="/boot/initramfs-[KERNEL_NAME].img"
...
fallback_image="/boot/initramfs-[KERNEL_NAME]-fallback.img"
```

- Generate the initramfs images for the custom kernel

```
mkinitcpio -p "$KERNEL_NAME"
```

9. Update the grub config so that the new kernel can be displayed as start up
option

```
# This command does the same as update-grub command in Ubuntu
grub-mkconfig -o /boot/grub/grub.cfg
```

10. Reboot the system and select your new kernel in the grub UI

```
reboot
```

## Reference
- Most of the tutorial follows the instruction in arch website. Refer it for
more details: https://wiki.archlinux.org/index.php/Kernels/Traditional_compilation
