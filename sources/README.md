# Archphile Sources


## ArchlinuxARM and Archlinux 


Archphile Distribution is based on [ArchlinuxARM](https://archlinuxarm.org/) (which is based on [Archlinux](https://www.archlinux.org/)).

Both ArchlinuxARM and Archlinux provide the whole recipe for each package by using a file called [PKGBUILD](https://wiki.archlinux.org/index.php/PKGBUILD) . Each PKGBUILD, amongst others,  includes a **url for the original source**, 
plus **any additional modifications**.


In [ArchlinuxARM subdirectory](https://github.com/archphile/recipe/tree/master/sources/ArchlinuxARM) you will find **git checkouts** of their [github repository](https://github.com/archlinuxarm/PKGBUILDs) **including all PKGBUILDs**
for the dates I have created each one of **the existing Archphile images**.

In addition to these PKGBUILDs, many ArchlinuxARM packages were built directly using the official Archlinux sources:

https://git.archlinux.org/svntogit/community.git/

https://git.archlinux.org/svntogit/packages.git/

These repositories **can be checked out to to the exact dates** with the provided ArchlinuxARM tars so that anyone
interested will be **able to have the complete set of PKGBUILDS** for each Archphile image.

The reason I didn't include them here is that these tars are huge. However I can assist anyone interested
in order to checkout in any of the required dates.




## Archphile Packages

In addition to the above, by navigating to the following links:

https://github.com/archphile/packages

https://github.com/archphile/playground

you will be able to have an **100% transparent view** on how exactly each one of the Archphile packages is created
and **follow the links** in order to get their **source code** .

Again, **you can checkout using any date you want** to be able to find out the exact package recipe for each one of 
Archphile releases.




## MPD

[MPD](https://www.musicpd.org/)  the most important software (apart form the core) used in Archphile and this is the reason that I have created a [dedicated subdirectory](https://github.com/archphile/recipe/tree/master/sources/MPD), including all the sources I have ever used for MPD Archphile packages.




## YMPD

[YMPD](https://github.com/notandy/ympd)  is another crucial software for Archphile. Using the link below, can view the sources of its 
official (github forked)  code:

https://github.com/archphile/ympd




## MPD Forks

Last but not least, by navigating to the following links, you will be able to get the code for two very nice
MPD forks included in Archphile (please see my **mpd-archphile-sacd** and **archphile-native-dsd** packages):

https://github.com/archphile/mpd-manisiutkin

https://github.com/archphile/mpd-dsd-019


## Additional Stuff

All the information above along with the **scripts** and **configuration files** used for the creation of Archphile images:

https://github.com/archphile/recipe/tree/master/scripts

https://github.com/archphile/recipe/tree/master/files

will give you the ability to **completely understand the internals of Archphile Distribution** and make it easier for
you **to fork my project**.




