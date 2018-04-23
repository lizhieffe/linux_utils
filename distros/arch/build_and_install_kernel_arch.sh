#/bin/sh

# Script to build and install linux kernel for arch linux.
# Useage:
#	if '-c' is present, clean before compile.

KERNEL_DIR="/root/development/linux"
echo "Going to kernel directory: ${KERNEL_DIR}"
cd "$KERNEL_DIR"

# git checkout v4.15

if [ "$#" -ne 1 ] && [ "$1" = "-c" ]; then
	echo "Cleaning env..."
	make clean
fi

CONFIG_FILE=".config"
if [ -f "${CONFIG_FILE}" ]; then
	echo "Deleting existing ${CONFIG_FILE} file"
	rm .config
fi
echo "Generating new ${CONFIG_FILE} file"
zcat /proc/config.gz > "${CONFIG_FILE}"

KERNEL_NAME="linux-custom"
CORES=`getconf _NPROCESSORS_ONLN`

echo "Compiling the kernel with name ${KERNEL_NAME} using ${CORES} cores..."
make -j "$CORES" LOCALVERSION=-"$KERNEL_NAME"

echo "Compiling the modules with using ${CORES} cores..."
make modules_install -j "$CORES" LOCALVERSION=-"$KERNEL_NAME"

echo "Copying the kernel binary to /boot directory..."
cp -v arch/x86_64/boot/bzImage /boot/vmlinuz-"$KERNEL_NAME"

echo "Making initial RAM disk..."
cp /etc/mkinitcpio.d/linux.preset /etc/mkinitcpio.d/"$KERNEL_NAME".preset
sed -i -E "s#ALL_kver=\".*\"#ALL_kver=\"/boot/vmlinuz-${KERNEL_NAME}\"#g" /etc/mkinitcpio.d/"$KERNEL_NAME".preset
sed -i -E "s#default_image=\".*\"#default_image=\"/boot/initramfs-${KERNEL_NAME}.img\"#g" /etc/mkinitcpio.d/"$KERNEL_NAME".preset
sed -i -E "s#fallback_image=\".*\"#fallback_image=\"/boot/initramfs-${KERNEL_NAME}-fallback.img\"#g" /etc/mkinitcpio.d/"$KERNEL_NAME".preset
mkinitcpio -p "$KERNEL_NAME"

echo "Updating grub config file..."
grub-mkconfig -o /boot/grub/grub.cfg

echo "The kernel is built and installed successfully. Please reboot and select the new kernel in the grub UI"
