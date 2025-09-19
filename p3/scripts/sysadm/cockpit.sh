#!/bin/bash
# name: Cockpit Server
# version: 1.0
# description: cockpit_desc
# icon: cockpit.png

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
# language
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
sudo_rq
if command -v rpm-ostree &>/dev/null; then
    _packages=(cockpit-system cockpit-ostree cockpit-podman cockpit-kdump cockpit-networkmanager)
else
    _packages=(cockpit)
fi
_install_
sudo systemctl enable --now cockpit.socket
zeninf "$msg018"