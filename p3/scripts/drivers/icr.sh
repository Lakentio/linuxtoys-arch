#!/bin/bash
# name: Intel Compute Runtime
# version: 1.0
# description: icr_desc
# icon: intel.png
# reboot: yes

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
# language
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
# function
icr_in () {
