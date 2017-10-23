recipe - installation scripts and files needed for Archphile
======

This repository contains some very basic scripts that I use in order to create archphile images. 
In order to use these scripts you must first install ArchlinuxARM.

- for Raspberry Pi 2:
http://archlinuxarm.org/platforms/armv7/broadcom/raspberry-pi-2

- for Udoo:
http://archlinuxarm.org/platforms/armv7/freescale/udoo

- for Cubox-i:
http://archlinuxarm.org/platforms/armv7/freescale/cubox-i


After that, login to your fresh ArchlinuxARM installation and install wget:

pacman -Sy wget

The last step is to download and run the script. The direct links of the scripts are:

- https://raw.githubusercontent.com/archphile/recipe/master/scripts/archphile-create-script-rpi-2
- https://raw.githubusercontent.com/archphile/recipe/master/scripts/archphile-create-script-udoo
- https://raw.githubusercontent.com/archphile/recipe/master/scripts/archphile-create-script-cuboxi


For example, if you have a Raspberry Pi 2 you have to do the following:

wget https://raw.githubusercontent.com/archphile/recipe/master/scripts/archphile-create-script-rpi-2

chmod +x archphile-create-script-rpi-2

./archphile-create-script-rpi-2


The scrips are dependent on ArchlinuxARM builds for the supported devices, which means that they might not work or need modifications when a new ArchlinuxARM image is released.

All scripts are licensed under the GNU GPL V2.








