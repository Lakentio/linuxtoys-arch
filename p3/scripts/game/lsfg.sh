#!/bin/bash
# name: Lossless Scaling
# version: 1.0
# description: lsfg_desc
# icon: lsfgvk.png

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
# language
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
source "$SCRIPT_DIR/libs/helpers.lib"
sudo_rq
zenwrn "$msg251"
tag=$(curl -s "https://api.github.com/repos/PancakeTAS/lsfg-vk/releases/latest" | grep -oP '"tag_name": "\K(.*)(?=")')
ver="${tag#v}"
DLL_FIND="$(find / -name Lossless.dll 2>/dev/null | head -n 1)"
if [ -z "$DLL_FIND" ]; then
    fatal "Lossless.dll not found. Did you install Lossless Scaling?"
else 
    DLL_ABSOLUTE_PATH=$(dirname "$(realpath "$DLL_FIND")")
    ESCAPED_DLL_PATH=$(printf '%s\n' "$DLL_ABSOLUTE_PATH" | sed 's/[&/\]/\\&/g')
    cd $HOME
    # try update if already installed
    if rpm -qi lsfg-vk &> /dev/null || pacman -Qi lsfg-vk 2>/dev/null 1>&2 || dpkg -s lsfg-vk 2>/dev/null 1>&2; then
unset PASSWD
