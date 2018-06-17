# Ubuntu 16 Notes

The board mentioned in this doc is Wandboard QuadPlus rev D1

## Install Ubuntu 16
1. Download ubuntu 16 image from Wandboard website https://www.wandboard.org/downloads/
2. Burn the image to sd card: `dd if=YOURSDCARDIMAGE of=/dev/YOURSDCARDDEVICE bs=1M`
3. Insert the sd card to the device and start it
4. The image only uses about 4GB of sd card and the system doesn't mount the
rest of the sd card. To mount the rest of sd card,

```
sudo fdisk /dev/mmcblk2
n
[ENTER]... to accept the default until the new partition is created
w

# restart and use `lsblk` to check the new partition is created

mkfs.ext4 /dev/mmcblk2p3
```

## Compile and Install Kernel

This instruction doesn't actually work. The kernel and modules can be compiled
and installed successfully, but the system would boot up.

TODO: Fix the problem.

The instruction is inspired by this doc: https://sysprogs.com/VisualKernel/tutorials/imx6/buildkernel/

```
mkdir development
sudo mount /dev/mmcblk2p3 development
cd development
# Give user permission for the mounted directory
sudo chown -R CURRENT_USER_NAME .

git clone https://github.com/wandboard-org/linux.git
git checkout -b wandboard_imx_4.1.15_1.1.0_ga
zcat /proc/config.gz > .config

# The kernel doesn't support gcc 5.x come with the Ubuntu 16, so install gcc 4.8 instead.
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install gcc-4.8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50
# Used to created compressed kernel image
sudo apt-get install lzop

# Compile kernel
KERNEL_NAME="linux-custom"
CORES=`getconf _NPROCESSORS_ONLN`

echo "Compiling the kernel with name ${KERNEL_NAME} using ${CORES} cores..."
make zImage -j "$CORES" LOCALVERSION=-"$KERNEL_NAME"

echo "Compiling the modules with using ${CORES} cores..."
make modules_install -j "$CORES" LOCALVERSION=-"$KERNEL_NAME"

# Replace the existing kernel with the compiled one.
sudo mkdir /mnt/boot
sudo mount /dev/mmcblk2p1 /mnt/boot
cp arch/arm/boot/zImage /mnt/boot/zImage

[RESTART]
```
