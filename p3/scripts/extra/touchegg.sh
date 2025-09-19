#!/bin/bash
# name: Touchégg
# version: 1.0
# description: touchegg_desc
# icon: touchegg.svg
# compat: ubuntu, debian, fedora, suse
# nocontainer

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
# language
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
# get latest release tag for touchegg
tag=$(curl -s "https://api.github.com/repos/JoseExposito/touchegg/releases/latest" | grep -oP '"tag_name": "\K(.*)(?=")')
if [ "$XDG_SESSION_TYPE" != "wayland" ]; then
    sudo_rq
    echo "$PASSWD" | sudo -S pacman -S --noconfirm touchegg
    echo "$PASSWD" | sudo -S systemctl enable touchegg.service
    echo "$PASSWD" | sudo -S systemctl start touchegg
else
    fatal "$msg077"
fi
unset PASSWD
