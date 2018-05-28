#/bin/sh

# Script to build and install linux kernel for Raspbian linux.

# Exit on error.
set -e

KERNEL_DIR="/home/lizhieffe/development/linux"
KERNEL="kernel7"

echo "Going to kernel directory: ${KERNEL_DIR}"
cd "$KERNEL_DIR"

echo "Generating config file"
make bcm2709_defconfig

echo "Compiling the kernel..."
make -j4 zImage modules dtbs
sudo make modules_install

echo "Copying the kernel binary to /boot directory..."
sudo cp arch/arm/boot/dts/*.dtb /boot/
sudo cp arch/arm/boot/dts/overlays/*.dtb* /boot/overlays/
sudo cp arch/arm/boot/dts/overlays/README /boot/overlays/
sudo cp arch/arm/boot/zImage /boot/$KERNEL.img

echo "The kernel is built and installed successfully. Please reboot and select the new kernel in the grub UI"
