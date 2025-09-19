#!/bin/bash
# name: Visual Studio Code
# version: 1.0
# description: code_desc
# icon: code.svg

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
source "$SCRIPT_DIR/libs/helpers.lib"
sudo_rq
cd $HOME
if zenity --question --text "$msg035" --width 360 --height 300; then
    chaotic_aur_lib
    sleep 1
    echo "$PASSWD" | sudo -S pacman -S --noconfirm visual-studio-code-bin
    zeninf "$msg018"
    exit 0
fi
_packages=(code)
_install_
zeninf "$msg018"
unset PASSWD
