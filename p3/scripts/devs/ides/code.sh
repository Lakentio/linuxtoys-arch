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
if [[ "$ID_LIKE" == *debian* ]] || [[ "$ID_LIKE" == *ubuntu* ]] || [ "$ID" == "debian" ] || [ "$ID" == "ubuntu" ]; then
    sudo curl -fsSLo /usr/share/keyrings/vscode-keyring.asc https://packages.microsoft.com/keys/microsoft.asc
    echo "deb [signed-by=/usr/share/keyrings/vscode-keyring.asc arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | echo "$PASSWD" | sudo -S tee /etc/apt/sources.list.d/vscode.list
    sudo apt-get update
elif [[ "$ID" =~ ^(arch|cachyos)$ ]] || [[ "$ID_LIKE" == *arch* ]] || [[ "$ID_LIKE" == *archlinux* ]]; then
    if zenity --question --text "$msg035" --width 360 --height 300; then
        chaotic_aur_lib
        sleep 1
        echo "$PASSWD" | sudo -S pacman -S --noconfirm visual-studio-code-bin
        zeninf "$msg018"
        exit 0
    fi
elif [[ "$ID_LIKE" =~ (rhel|fedora) ]] || [[ "$ID" =~ (fedora) ]]; then
    if command -v rpm-ostree &>/dev/null; then
        echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | echo "$PASSWD" | sudo -S tee /etc/yum.repos.d/vscode.repo > /dev/null
    else
        sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
        echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | echo "$PASSWD" | sudo -S tee /etc/yum.repos.d/vscode.repo > /dev/null
        sudo dnf check-update
    fi
elif [[ "$ID_LIKE" == *suse* ]]; then
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" |echo "$PASSWD" | sudo -S tee /etc/zypp/repos.d/vscode.repo > /dev/null
fi
_packages=(code)
_install_
zeninf "$msg018"
unset PASSWD
