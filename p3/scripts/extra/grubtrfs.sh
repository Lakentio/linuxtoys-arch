#!/bin/bash
# name: GRUB-btrfs
# version: 1.0
# description: grubtrfs_desc
# icon: grubtrfs.svg
# compat: ubuntu, debian, arch, fedora, suse
# nocontainer

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
# language
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
# functions
# check dependencies
dep_check () {
    # Check for GRUB installation across different distributions
    grub_found=false
zeninf "$msg036"