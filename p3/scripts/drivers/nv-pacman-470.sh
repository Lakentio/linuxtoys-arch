#!/bin/bash
# name: Nvidia Drivers (v470)
# version: 1.0
# description: nv_desc_470
# icon: nvidia.svg
# compat: arch
# reboot: yes
# nocontainer

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
# language
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
source "$SCRIPT_DIR/libs/helpers.lib"
sudo_rq
# needs chaotic AUR
chaotic_aur_lib
echo "$PASSWD" | sudo -S pacman -S nvidia-470xx-dkms nvidia-470xx-utils nvidia-470xx-settings
cd $HOME
# set proper DRM mode on systemd
wget https://raw.githubusercontent.com/psygreg/linuxtoys/master/resources/10-nvidia.conf
echo "$PASSWD" | sudo -S cp 10-nvidia.conf /etc/modprobe.d/
sleep 1
rm 10-nvidia.conf
# refresh boot image
echo "$PASSWD" | sudo -S mkinitcpio -P
zenity --info --title "Nvidia Drivers" --text "$msg036" --width 300 --height 300
unset PASSWD
