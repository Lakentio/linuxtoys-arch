#!/bin/bash
# name: Godot Engine 4 Sharp
# version: 1.0
# description: godotsharp_desc
# icon: godotsh.svg
# compat: fedora, ubuntu, debian, ostree, ublue, suse

# --- Start of the script code ---
# when there are updates, make sure to edit the .desktop files in resources/godot as well!
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
cd $HOME
