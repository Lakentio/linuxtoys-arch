#!/bin/bash
# name: Nord VPN
# version: 1.0
# description: Nord VPN
# icon: nordvpn.svg
# compat: ubuntu, debian, fedora, arch, cachy, suse

# --- Start of the script code ---
. /etc/os-release
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
source "$SCRIPT_DIR/libs/helpers.lib"
sudo_rq
