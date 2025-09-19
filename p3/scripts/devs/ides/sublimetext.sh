#!/usr/bin/env bash
# name: Sublime Text
# version: 4
# description: sublime_desc
# icon: sublime.png

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
source "$SCRIPT_DIR/libs/helpers.lib"
sudo_rq
# Instalação para Arch Linux e derivados
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && echo "$PASSWD" | sudo -S pacman-key --add sublimehq-pub.gpg && echo "$PASSWD" | sudo -S pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | echo "$PASSWD" | sudo -S tee -a /etc/pacman.conf
echo "$PASSWD" | sudo -S pacman -Syu
_packages=(sublime-text)
_install_
zeninf "$msg018" # Mensagem de "Operações concluídas."

unset PASSWD
