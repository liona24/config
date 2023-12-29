#!/bin/bash

set -e

INSTALLER=apt-get

if ! [ -x "$(command -v $INSTALLER)" ]; then
    INSTALLER=dnf
fi

sudo $INSTALLER install -y zsh

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)

shell_config=$HOME/.zshrc

echo "Using config file $shell_config"

git clone https://github.com/zdharma/fast-syntax-highlighting.git \
  "$HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting"

git clone https://github.com/zsh-users/zsh-autosuggestions.git \
  "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

sed -i 's/^plugins=\(.*\)/plugins=(git fast-syntax-highlighting zsh-autosuggestions)/' "$shell_config"

echo '
# Disable git status because of poor performance in large repositories
RPROMPT=""
DISABLE_UNTRACKED_FILES_DIRTY="true"

alias clip="xclip -sel clipboard"
alias p=python3
alias g=git
alias gc="git checkout"' >> "$shell_config"
