#!/bin/bash
# name: Waydroid
# version: 1.0
# description: waydroid_desc
# icon: waydroid.svg
# compat: fedora, ostree, debian, ubuntu, arch, cachy, ublue
# nocontainer

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
source "$SCRIPT_DIR/libs/helpers.lib"
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    sudo_rq
    _packages=(waydroid)
