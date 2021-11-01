#!/bin/bash

sudo apt-get update --fix-missing
sudo apt-get remove -y vim
sudo apt-get install -y python3-neovim

curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
(mkdir -p $HOME/.config/nvim || : ) 2> /dev/null
cp ./vim/vimrc $HOME/.config/nvim/init.vim
vim --headless +PlugInstall +qall > /dev/null
