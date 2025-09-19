#!/bin/bash
# name: Preload
# version: 1.0
# description: preload_desc
# icon: preload.svg
# compat: ubuntu, debian, fedora, ostree, ublue, cachy, arch
# reboot: ostree
# noconfirm: yes
# nocontainer

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
# language
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
source "$SCRIPT_DIR/libs/helpers.lib"
# RAM check
total_kb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
total_gb=$(( total_kb / 1024 / 1024 ))
_cram=$(( total_gb ))
# install only if user has enough RAM for preloading to not cause any issues
if (( _cram > 12 )); then
    if zenity --question --text "$msg208" --width 360 --height 300; then
        sudo_rq
