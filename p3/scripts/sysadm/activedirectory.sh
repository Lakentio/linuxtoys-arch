#!/bin/bash
# name: Active Directory
# version: 1.0
# description: adir_desc
# icon: adir.svg
# compat: debian, ubuntu, fedora, ostree, ublue

#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
# language
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
sudo_rq
