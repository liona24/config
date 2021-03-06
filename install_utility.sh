#!/bin/bash

set -e

INSTALLER=dnf

if ! [ -x "$(command -v $INSTALLER)" ]; then
    INSTALLER=apt-get
    sudo $INSTALLER update --fix-missing
fi

sudo $INSTALLER install -y \
    build-essential \
    curl \
    wget \
    unzip \
    ca-certificates \
    xclip \
    git \
    python3-pip \
    python3-venv \
    cmake \
    ripgrep \
    netcat

git clone https://github.com/liona24/utility-scripts.git $HOME/utility-scripts

echo '
export PATH="$PATH:$HOME/utility-scripts"' >> $HOME/.zshrc
