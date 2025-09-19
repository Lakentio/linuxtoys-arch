#!/bin/bash
# name: OpenRazer
# version: 1.0
# description: oprzr_desc
# icon: gaming.svg
# compat: ubuntu, debian, fedora, suse, arch, cachy, ostree
# nocontainer

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
source "$SCRIPT_DIR/libs/helpers.lib"
_packages=(openrazer-meta)
sudo_rq
flatpak_in_lib
flatpak install -y --system --noninteractive flathub app.polychromatic.controller
zeninf "$msg036"