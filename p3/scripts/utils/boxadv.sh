#!/bin/bash
# name: Distrobox-Adv
# version: 1.0
# description: Container do Debian via distrobox com pacotes que fornecem ambiente para uso de certificado digital por advogados no Brasil. Também inclui o Distroshelf.
# icon: boxadv.svg
# localize: pt

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
source "$SCRIPT_DIR/libs/helpers.lib"
sudo_rq
