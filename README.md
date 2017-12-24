recipe - installation scripts and files needed for Archphile
======

This repository contains some very basic scripts that I use in order to create archphile images. 
In order to use these scripts you must first install ArchlinuxARM.

- for Raspberry Pi 2 and 3:

http://archlinuxarm.org/platforms/armv7/broadcom/raspberry-pi-2
https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-3

- for Odroid C2:

https://archlinuxarm.org/platforms/armv8/amlogic/odroid-c2


After that, login to your fresh ArchlinuxARM installation as root (you will need 
PermitRootLogin yes" >> /etc/ssh/sshd_config):

    pacman -Sy wget

The last step is to download and run the script. The direct links of the scripts are:

- https://raw.githubusercontent.com/archphile/recipe/master/scripts/archphile-create-script-rpi
- https://raw.githubusercontent.com/archphile/recipe/master/scripts/archphile-create-script-odroidc2

For example, if you have a Raspberry Pi 2 or 3 you have to do the following:

    wget https://raw.githubusercontent.com/archphile/recipe/master/scripts/archphile-create-script-rpi

    chmod +x archphile-create-script-rpi

    ./archphile-create-script-rpi


The scrips are dependent on ArchlinuxARM builds for the supported devices, which means that they might not work or need modifications when a new ArchlinuxARM image is released.

All scripts are licensed under the GNU GPL V2.












