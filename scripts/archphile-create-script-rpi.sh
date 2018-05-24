#!/bin/bash
###################### Archphile Creation Script for Raspberry Pi 2 and 3 ############################
##  Before running this script, you need to enable ssh root login with the following command"
##  echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
##  and then log in as root.
##  Please also make sure that wget is installed (pacman -Sy wget)

function c_color {
# Setting red color for messages
clear
red='\e[0;31m'
NC='\e[0m'
}

function c_root {
# Checking for root user
if [[ $EUID -ne 0 ]]; then
	echo -e "${red}This script must be run as root..${NC}" 
	exit 1
fi
}

function c_net {
# Checking internet connection
wget -q --tries=10 --timeout=20 --spider http://google.com
if [[ $? -ne 0 ]]; then
        echo -e "${red}Please make sure that you have a functional internet connection and try again...${NC}"
        exit 1
fi
}

function c_password {
# Deleting alarm user and changing Root password
echo -e "${red}Deleting alarm user...${NC}" 
userdel -r alarm
echo -e "${red}Change the root password...${NC}" 
passwd
}

function c_hostname {
# Changing hostname
echo -e "${red}Changing your hostname...${NC}" 
hostnamectl set-hostname archphile
}

function c_motd {
# /etc/motd text
echo -e "${red}Downloading sample /etc/motd file...${NC}" 
wget https://raw.githubusercontent.com/archphile/recipe/master/files/motd-rpi -O /etc/motd
nano /etc/motd
}

function c_dns {
# Changing DNS servers
echo -e "${red}Changing to Google DNS servers...${NC}" 
systemctl disable systemd-resolved
systemctl mask systemd-resolved
rm /etc/resolv.conf
cat > /etc/resolv.conf <<"EOF"
# Google DNS
nameserver 8.8.8.8
nameserver 8.8.4.4
# Opendns
#nameserver 208.67.222.222 
#nameserver 208.67.220.220
EOF
echo -e "${red}Disallowing dhcpcd to change DNS servers...${NC}" 
echo "nohook resolv.conf" >>/etc/dhcpcd.conf
}

function c_modules {
# Disabling various modules
echo -e "${red}Disabling various modules...${NC}" 
cat > /etc/modprobe.d/blacklist.conf <<"EOF"
#blacklist snd-bcm2835
EOF
}

function c_network {
# Network Configuration
echo -e "${red}Changing netctl network configuration...${NC}" 
wget https://raw.githubusercontent.com/archphile/recipe/master/files/archphile-network -O /etc/netctl/archphile-network
systemctl disable systemd-networkd
systemctl mask systemd-networkd
netctl enable archphile-network
}

function c_ipv6 {
# Disabling ipv6
# "net.ipv6.conf.all.disable_ipv6=1" added throught archphile-optimize package 
sed -e '/::1/ s/^#*/#/' -i /etc/hosts
echo >>/etc/dhcpcd.conf
echo "#Disable ipv6 connectivity" >>/etc/dhcpcd.conf
echo "noipv6rs" >>/etc/dhcpcd.conf
echo "noipv6" >>/etc/dhcpcd.conf
}

function c_timezone {
# Locale and timezone configuration
systemctl disable systemd-timesyncd
systemctl mask systemd-timesyncd
pacman -Sy ntp --noconfirm
echo -e "${red}Changing locale, timezone and ntp configuration...${NC}" 
sed -i 's/^#en_US.UTF-8 UTF-8.*/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG="en_US.UTF-8"" > /etc/locale.conf
rm /etc/localtime
ln -s /usr/share/zoneinfo/Europe/Athens /etc/localtime
wget https://raw.githubusercontent.com/archphile/recipe/master/files/ntp.conf -O /etc/ntp.conf
}

function c_fstab {
# /etc/fstab tweaking
echo -e "${red}Changing fstab entries...${NC}" 
wget https://raw.githubusercontent.com/archphile/recipe/master/files/fstab-rpi -O /etc/fstab
}

function c_history {
# Linking .bash_history to /dev/null
echo -e "${red}Linking .bash_history to /dev/null...${NC}" 
rm /root/.bash_history
ln -sf /dev/null ~/.bash_history
}

function c_repo {
# Adding Archphile repository
echo -e "${red}Adding Archphile Repository...${NC}" 
cat >> /etc/pacman.conf <<"EOF"
[archphile]
SigLevel = Never
Server = http://archphile.org/repo/arm7/09973

[playground]
SigLevel = Never
Server = http://archphile.org/repo/playground/arm7/09973
EOF
}

function c_syspack {
# Updating ArchlinuxARM	
echo -e "${red}Updating system...${NC}" 
pacman -Syu --noconfirm

# Installing system packages
echo -e "${red}Installing system related packages...${NC}" 
pacman -S samba cifs-utils nfs-utils udevil ntfs-3g htop avahi wpa_supplicant wireless_tools iw dhcpcd ethtool hd-idle lirc --noconfirm
}

function c_archpack {
# Installing audio related packages
echo -e "${red}Installing audio related packages...${NC}" 
pacman -S alsa-utils mpd-archphile mpc mpdscribble ympd-archphile archphile-optimize upmpdcli-archphile shairport-sync brutefir alsacap mongoose librespot-archphile --noconfirm

# Making python2 default for upmpdcli
echo -e "${red}Making python2 the default one...${NC}" 
ln -s /usr/bin/python2 /usr/bin/python
}

function c_purgepack {
# Removing unneeded packages and cleaning pacman cache
echo -e "${red}Removing unneeded packages and cleaning pacman cache...${NC}" 
pacman -Rcsn lvm2 mdadm reiserfsprogs xfsprogs man-db which s-nail licenses jfsutils gettext logrotate --noconfirm
pacman -Scc
}

function c_target {
# Setting multi-user.target as the new default target
echo -e "${red}Setting default systemd target...${NC}" 
systemctl set-default -f multi-user.target
}

function c_services {
# Enabling systemd services
echo -e "${red}Enabling needed Systemd services...${NC}" 
systemctl enable mpd
systemctl enable ympd
systemctl enable archphile
systemctl enable avahi-daemon
}

function c_mpdconf {
# Creating stuff for MPD
echo -e "${red}Creating directories needed by MPD and downloading webradios...${NC}" 
mkdir /mnt/nas-nfs
mkdir /mnt/nas-samba
mkdir /mnt/usb-disk
mkdir /var/lib/mpd/music
cd /var/lib/mpd/music
ln -s /mnt/nas-nfs
ln -s /mnt/nas-samba
ln -s /mnt/usb-disk
wget https://github.com/archphile/recipe/raw/master/files/webradio.tar.gz
tar xvfz webradio.tar.gz
rm webradio.tar.gz
gpasswd -a mpd audio
chown -R mpd:audio /var/lib/mpd
}

function c_asound {
# setting the USB or I2S DAC as default sound card
echo -e "${red}Setting the USB DAC as the default sound card...${NC}" 
cat > /etc/asound.conf <<"EOF"
pcm.!default {
        type hw
        card 0
}

ctl.!default {
        type hw
        card 0
}
EOF
}

function c_udevil {
# udevil configuration
echo -e "${red}Creating udevil configuration and enabling devmon service...${NC}" 
wget https://raw.githubusercontent.com/archphile/recipe/master/files/udevil.conf -O /etc/udevil/udevil.conf
systemctl enable devmon@root
}

function c_jlog {
# journald.conf configuration and /var/log deletion
echo -e "${red}Changing journald.conf configuration and deleting /var/log...${NC}" 
sed -i 's/^#Storage=auto.*/Storage=none/' /etc/systemd/journald.conf
rm -R /var/log
}

function c_covers {
# settings for fetching local cover art using Mpdroid and Mpod
echo -e "${red}Making symlinks for fetching local cover art${NC}" 
mkdir -p /var/www/covers
mkdir -p /var/www/Music
ln -s /var/lib/mpd/music /var/www/covers
ln -s /var/lib/mpd/music /var/www/Music
}

function c_spindown {
# disks spin-down configuration
echo -e "${red}Fetching udev rules for hdparm...${NC}" 
mkdir /opt/archphile
wget https://raw.githubusercontent.com/archphile/recipe/master/files/50-hdparm.rules-onedisk -O /opt/archphile/50-hdparm.rules-onedisk
wget https://raw.githubusercontent.com/archphile/recipe/master/files/50-hdparm.rules-manydisks -O /opt/archphile/50-hdparm.rules-manydisks
wget https://raw.githubusercontent.com/archphile/recipe/master/files/hd-idle -O /etc/conf.d/hd-idle
}

function c_samba {
# sharing usb disks with samba configuration
echo -e "${red}Fetching samba configuration for sharing usb disks...${NC}" 
wget https://raw.githubusercontent.com/archphile/recipe/master/files/smb.conf -O /etc/samba/smb.conf
echo -e "${red}In order to share your usb disk please enable and start smbd and nmbd service...${NC}"
}

function c_shairport {
# Setting configuration for shairport-sync
echo -e "${red}Setting shairport-sync configuration..${NC}" 
wget https://raw.githubusercontent.com/archphile/recipe/master/files/shairport-sync.conf -O /etc/shairport-sync.conf
}

function c_cmdline {
# Changing cmdline options
echo -e "${red}Updating cmdline.txt...${NC}" 
wget https://raw.githubusercontent.com/archphile/recipe/master/files/cmdline.txt -O /boot/cmdline.txt
}

function c_config {
# Changing config.txt options
echo -e "${red}Updating config.txt...${NC}" 
wget https://raw.githubusercontent.com/archphile/recipe/master/files/config.txt -O /boot/config.txt
}

function c_tweaks {
# Applying various tweaks by default
echo -e "${red}Applying various tweaks/mods ...${NC}" 
echo "Archphile \r (\l)" > /etc/issue
sed -i 's/#Color/Color/' /etc/pacman.conf
sed -i '/tvservice/s/^#//g' /usr/bin/archphile-optimize 
sed -i '/pidof mpd/s/^#//g' /usr/bin/archphile-optimize
sed -i '/2 $(pidof ympd)/s/^#//g' /usr/bin/archphile-optimize
}

function c_cleanup {
# Cleaning up..
echo -e "${red}Cleaning up system...${NC}" 
rm /etc/ssh/ssh_host_*
rm /root/archphile-create-script*
echo -e "${red}PLEASE REBOOT YOUR SYSTEM IMMEDIATELY!!!!!!${NC}" 
}

c_color
c_root
c_net
c_password
c_hostname
c_motd
c_dns
c_modules
c_network
c_ipv6
c_timezone
c_fstab
c_history
c_repo
c_syspack
c_archpack
c_purgepack
c_target
c_services
c_mpdconf
c_asound
c_udevil
c_jlog
c_covers
c_spindown
c_samba
c_shairport
c_cmdline
c_config
c_tweaks
c_cleanup

