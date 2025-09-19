#!/bin/bash
# name: Docker
# version: 1.0
# description: docker_desc
# icon: docker.svg
# nocontainer
# reboot: ostree

# --- Start of the script code ---
#SCRIPT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$SCRIPT_DIR/libs/linuxtoys.lib"
# functions
docker_in () { # install docker
    cd $HOME
