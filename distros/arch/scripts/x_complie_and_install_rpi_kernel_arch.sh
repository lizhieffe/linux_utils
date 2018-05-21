#/bin/sh

# Script to cross compile the RPI 3 kernel and copy it to the sd card for arch
# linux.
#
# Inspired by doc: https://www.raspberrypi.org/documentation/linux/kernel/building.md
#
# For toolchain error, please refer to the doc above.
#
# Useage:
#	if '-c' is present, clean before compile.

# Exit on error.
set -e

KERNEL=kernel7
KERNEL_DIR="$HOME/development/rpi_linux"
CONFIG_FILE=".config"
CORES=`getconf _NPROCESSORS_ONLN`
SD_CARD=sdd
MOUNT_DIR="/tmp/rpi_mnt/"

if [ -e "/dev/$SD_CARD1" ] && [ -e "/dev/$SD_CARD2" ] && [ -e "/dev/$SD_CARD5" ] && [ -e "/dev/$SD_CARD6" ] && [ -e "/dev/$SD_CARD7" ]; then
  echo "Find SD card on $SD_CARD"
else
  echo "Error: no SD card is found on $SD_CARD, please use `lsblk` command to check if the device exists."
  exit
fi

echo "Going to kernel directory: ${KERNEL_DIR}"
cd "$KERNEL_DIR"

if [ "$#" -ne 1 ] && [ "$1" = "-c" ]; then
	echo "Cleaning env..."
	sudo make clean
fi

if [ -f "${CONFIG_FILE}" ]; then
	echo "Deleting existing ${CONFIG_FILE} file"
	rm .config
fi

echo "Generating the kernel config..."
sudo make -j "$CORES" ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcm2709_defconfig

echo "Compiling the kernel with name ${KERNEL} using ${CORES} cores..."
sudo make -j "$CORES" ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- zImage modules dtbs

if [ -d "$MOUNT_DIR" ]; then
  rm -rf "$MOUNT_DIR"
fi
mkdir "$MOUNT_DIR"
mkdir "$MOUNT_DIR"/fat32
mkdir "$MOUNT_DIR"/ext4
sudo mount /dev/"$SD_CARD"6 "$MOUNT_DIR"/fat32
sudo mount /dev/"$SD_CARD"7 "$MOUNT_DIR"/ext4

echo "Compiling and installing the modules with using ${CORES} cores..."
sudo make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH="$MOUNT_DIR"/ext4 modules_install

echo "Copying the kernel to SD card $SD_CARD"
sudo cp "$MOUNT_DIR"/fat32/$KERNEL.img "$MOUNT_DIR"/fat32/$KERNEL-backup.img
sudo cp arch/arm/boot/zImage "$MOUNT_DIR"/fat32/$KERNEL.img
sudo cp arch/arm/boot/dts/*.dtb "$MOUNT_DIR"/fat32/
sudo cp arch/arm/boot/dts/overlays/*.dtb* "$MOUNT_DIR"/fat32/overlays/
sudo cp arch/arm/boot/dts/overlays/README "$MOUNT_DIR"/fat32/overlays/
sudo umount "$MOUNT_DIR"/fat32
sudo umount "$MOUNT_DIR"/ext4

echo "Ejecting the SD card $SD_CARD"
udisksctl power-off -b /dev/"$SD_CARD"

echo "The kernel is built and installed to SD card $SD_CARD successfully. Please plug it in your RPI device and restart."
