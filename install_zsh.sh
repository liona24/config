#!/bin/bash

sudo apt-get update --fix-missing
sudo apt-get install -y zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)

shell_config=$HOME/.zshrc

echo "Using config file $shell_config"

git clone https://github.com/zdharma/fast-syntax-highlighting.git \
  "$HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting"

git clone https://github.com/zsh-users/zsh-autosuggestions.git \
  "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

exit 0

sed -i 's/^plugins=\(.*\)/plugins=(git fast-syntax-highlighting zsh-autosuggestions)/' "$shell_config"

echo '
# Disable git status because of poor performance in large repositories
RPROMPT=""
DISABLE_UNTRACKED_FILES_DIRTY="true"

alias clip="xclip -sel clipboard"
alias p=python3
alias g=git
alias gc="git checkout"' >> "$shell_config"

