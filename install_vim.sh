#!/bin/bash

set -e

INSTALLER=dnf

if ! [ -x "$(command -v $INSTALLER)" ]; then
    INSTALLER=apt-get
    sudo $INSTALLER update --fix-missing
fi

sudo $INSTALLER remove -y vim vi
sudo $INSTALLER install -y python3-neovim

curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
(mkdir -p $HOME/.config/nvim || : ) 2> /dev/null
ln -s -f $(pwd)/vimrc $HOME/.config/nvim/init.vim


if ! [ -x "$(command -v vim)" ]; then
    alias vim=nvim
    echo '
alias vim=nvim' >> $HOME/.zshrc
fi

vim --headless +PlugInstall +qall > /dev/null
