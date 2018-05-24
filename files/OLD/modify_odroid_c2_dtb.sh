#!/bin/bash

VAR_ORG=0xbebc200
VAR_NEW=0x8f0d180
VAR_DTB=/boot/dtbs/amlogic/meson-gxbb-odroidc2.dtb
VAR_DTS=/boot/dtbs/amlogic/meson-gxbb-odroidc2.dts

# decompile meson-gxbb-odroidc2.dtb
/usr/bin/dtc -I dtb -O dts -o ${VAR_DTS} ${VAR_DTB}

# change max-frequency for eMMC from 0xbebc200 to 0x8f0d180
/usr/bin/sed -i "s/${VAR_ORG}/${VAR_NEW}/g" ${VAR_DTS}

# compile modified dts to meson-gxbb-odroidc2.dtb
/usr/bin/dtc -O dtb -b O -o ${VAR_DTB} ${VAR_DTS}

# Script taken from: https://forum.odroid.com/viewtopic.php?f=135&t=22717&start=700#p215574