# Kernel Driver

## Build customized driver as part of kernel image

1. In drivers/ folder of kernel source, create new folder for your customized
driver; or you can place your driver in existing folder.

2. Create your driver DRIVER_NAME.c

3. Edit the Kconfig file in the folder. Follow the pattern for Kconfig file in
other folder, and add these lines:

```
config DRIVER_NAME
  bool "Some descriptions."
  default m
  help
    Say Y here if you want to support the DRIVER_NAME device.
    When in doubt, say "Y".
```

Replace the `default m` with `default y` if you want the driver built in;
otherwise it will be a loadable module.

4. Edit the Makefile in the folder. Follow the pattern for Makefile in other
folder, and add this line:

```
+obj-m        += MODULE_NAME.o
```

5. Modify the Kconfig file in drivers/ folder, add this line:

```
+source "drivers/NEW_FOLDER_NAME/Kconfig"
```

6. Build the kernal and modules. (using the scripts in distros/arch/scripts
folder)

7. The customized module will not be installed automatically on boot, because it
is not in the predefined list. To make it installed on boot, go to folder
`/etc/modules-load.d/`, add file `MODULE_NAME.conf`, and add line

```
MODULE_NAME
```
