#!/bin/bash
# name: WireGuard
# version: 1.0
# description: WireGuard
# icon: wireguard.svg
# compat: ubuntu, debian, fedora, arch, cachy, suse

# --- Start of the script code ---
. /etc/os-release
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
sudo_rq
