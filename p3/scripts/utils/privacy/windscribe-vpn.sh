#!/bin/bash
# name: Windscribe VPN
# version: 1.0
# description: Windscribe VPN
# icon: windscribe.svg

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
sudo_rq
cd $HOME
zeninf "$msg018"

unset PASSWD
