#!/bin/bash
# name: Broadcom WiFi
# version: 1.0
# description: bcm_desc
# icon: bcm.png
# compat: fedora, ostree, ublue, arch, cachy
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
zeninf "$msg036"
unset PASSWD
