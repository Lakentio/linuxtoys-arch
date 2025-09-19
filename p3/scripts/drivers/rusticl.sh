#!/bin/bash
# name: RustiCL
# version: 1.0
# description: rusticl_desc
# icon: device.svg
# reboot: yes

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
# language
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
# function
rusticl_in () {
