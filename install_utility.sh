#!/bin/bash

set -e

INSTALLER=dnf

if ! [ -x "$(command -v $INSTALLER)" ]; then
    INSTALLER=apt-get
    sudo $INSTALLER update --fix-missing
fi

sudo $INSTALLER install -y \
    curl \
    wget \
    unzip \
    ca-certificates \
    git \
    python3-pip \
    cmake \
    ripgrep \
    netcat

git clone https://github.com/liona24/utility-scripts.git $HOME/utility-scripts

echo '
export PATH="$PATH:$HOME/utility-scripts"' >> $HOME/.zshrc
