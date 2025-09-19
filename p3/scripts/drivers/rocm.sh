#!/bin/bash
# name: ROCm
# version: 1.0
# description: rocm_desc
# icon: amd.png
# reboot: yes

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
# language
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
# functions
rocm_rpm () {
    local GPU=$(lspci | grep -Ei '(radeon|rx)')
    if [[ -n "$GPU" ]]; then
        _packages=()
