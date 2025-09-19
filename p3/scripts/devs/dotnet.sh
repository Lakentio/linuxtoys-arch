#!/bin/bash
# name: .NET SDK
# version: 1.0
# description: dotnet_desc
# icon: dotnet.svg
# compat: fedora, suse, ostree, debian, ubuntu, ublue

# --- Start of the script code ---
# I am aware there is an AUR package for this. But AUR packages cannot be presumed safe, and it is not officially supported by Microsoft.
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
cd $HOME
sudo_rq
_packages=(dotnet-sdk)
_install_
zeninf "$msg018"