#!/bin/bash
# name: Steam
# version: 1.0
# description: steam_desc
# icon: steam.svg
# nocontainer: ubuntu, debian, suse

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
# language
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
source "$SCRIPT_DIR/libs/helpers.lib"
sudo_rq
multilib_chk
_packages=(steam steam-devices)
_install_