#!/bin/bash
# name: pdefaults
# version: 1.0
# description: pdefaults_desc
# icon: optimizer.svg
# compat: ubuntu, debian, fedora, suse, arch, cachy
# reboot: yes
# noconfirm: yes
# nocontainer

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
source "$SCRIPT_DIR/libs/optimizers.lib"
# language
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
source "$SCRIPT_DIR/libs/helpers.lib"
# system-agnostic scripts
sysag_run () {
    if [[ "$ID" != "cachyos" ]]; then
        # systemd patches
        cachyos_sysd_lib
    fi
    # shader booster
    sboost_lib
    # disable split-lock mitigation, which is not a security feature therefore is safe to disable
    dsplitm_lib
    # add earlyoom configuration
    earlyoom_lib
    # add alive timeout fix for Gnome
    if echo "$XDG_CURRENT_DESKTOP" | grep -qi 'gnome'; then
        sudo gsettings set org.gnome.mutter check-alive-timeout 20000
    fi
    # fix video thumbnails
    _packages=(ffmpegthumbnailer)
    # codec fix for Fedora/OpenSUSE
