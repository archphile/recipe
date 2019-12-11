recipe - installation scripts and files needed for Archphile
======

This repository contains some very basic scripts that I use in order to create archphile images. 
In order to use these scripts you must first install ArchlinuxARM.

- for Raspberry Pi 2 and 3:

https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-3

- for Odroid C2:

https://archlinuxarm.org/platforms/armv8/amlogic/odroid-c2


After that, login to your fresh ArchlinuxARM installation as root (you will need 
PermitRootLogin yes" >> /etc/ssh/sshd_config):

    pacman -Sy wget

The last step is to download and run the script. The direct links of the scripts are:

- https://raw.githubusercontent.com/archphile/recipe/master/scripts/archphile-create-script-rpi.sh
- https://raw.githubusercontent.com/archphile/recipe/master/scripts/archphile-create-script-odroidc2.sh

For example, if you have a Raspberry Pi 2 or 3 you have to do the following (logged via SSH as root):

    wget https://raw.githubusercontent.com/archphile/recipe/master/scripts/archphile-create-script-rpi.sh

    chmod +x archphile-create-script-rpi.sh

    ./archphile-create-script-rpi


The scrips are dependent on ArchlinuxARM builds for the supported devices, which means that they might not work or need modifications when a new ArchlinuxARM image is released.

All scripts are licensed under the GNU GPL V2.


## Note (2019-12-11)

These scripts need constant changes in order to be compliant with a rolling release distro like ArchlinuxARM.

In addition to the above, archphile packages need rebuilding after several libraries updates. I used to update/rebuild the packages before each release. I don't anymore. This means that if you use the scripts with my repos on it, your installation will fail 100%.









