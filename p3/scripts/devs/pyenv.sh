#!/bin/bash
# name: PyEnv
# version: 1.0
# description: pyenv_desc
# icon: python.svg

# --- Start of the script code ---
# install dependencies
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
_lang_
source "$SCRIPT_DIR/libs/lang/${langfile}.lib"
sudo_rq
_install_
# pyenv installation and addition to PATH
curl -fsSL https://pyenv.run | bash
if [[ -f "${HOME}/.bash_profile" ]]; then
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
    echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(pyenv init - bash)"' >> ~/.bash_profile
elif [[ -f "$HOME/.profile" ]]; then
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
    echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
    echo 'eval "$(pyenv init - bash)"' >> ~/.profile
fi
if [[ -f "$HOME/.zshrc" ]]; then
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc
fi
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
# basic usage instruction prompt
zeninf "$msg135"
xdg-open https://github.com/pyenv/pyenv?tab=readme-ov-file#usage
xdg-open https://github.com/pyenv/pyenv-virtualenv?tab=readme-ov-file#usage