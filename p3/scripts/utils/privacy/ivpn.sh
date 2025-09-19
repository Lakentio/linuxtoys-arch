#!/bin/bash
# name: IVPN
# version: 1.0
# description: IVPN
# icon: ivpn.svg
# compat: ubuntu, debian, fedora, ostree, ublue

# --- Start of the script code ---
. /etc/os-release
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
sudo_rq
