#!/bin/bash
# name: Xpadneo
# version: 1.0
# description: xneo_desc
# icon: gaming.svg
# compat: fedora, ubuntu, debian, ostree, suse, arch
# reboot: yes
# nocontainer

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
# language
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
sudo_rq
_install_
cd $HOME
git clone https://github.com/atar-axis/xpadneo.git
cd xpadneo
sudo ./install.sh
cd ..
rm -r xpadneo
zeninf "$msg036"