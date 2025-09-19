#!/bin/bash
# name: Unity Hub
# version: 1.0
# description: unityhub_desc
# icon: unityhub.svg
# compat: debian, ubuntu, fedora, ostree, ublue

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
# Unity Hub não está disponível nativamente no Arch Linux
# Usando Flatpak como alternativa
flatpak_in_lib
flatpak install --or-update --user --noninteractive flathub com.unity.UnityHub
zeninf "$msg018"