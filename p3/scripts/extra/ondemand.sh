#!/bin/bash
# name: CPU ondemand
# version: 1.0
# description: ondemand_desc
# icon: optimizer.svg
# compat: ubuntu, debian, fedora, suse, arch, ostree, ublue
# reboot: yes
# nocontainer

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
# language
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
source "$SCRIPT_DIR/libs/optimizers.lib"
LT_PROGRAM="On-Demand Governor"
sudo_rq
if [ ! -f /etc/systemd/system/set-ondemand-governor.service ]; then
    pp_ondemand
else
    if zenity --question --text "$msg288" --height=330 --width=330; then
        if command -v rpm-ostree &> /dev/null; then
            sudo rpm-ostree kargs --delete="intel_pstate=disable"
        else
            if [ -f /etc/grub.d/01_intel_pstate_disable ]; then
                sudo rm -f /etc/grub.d/01_intel_pstate_disable
                # Update GRUB configuration
