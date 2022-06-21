#!/bin/bash

ln -s -f $(pwd)/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
ln -s -f $(pwd)/vscode/settings.json $HOME/.config/Code/User/settings.json

(mkdir -p $HOME/.config/Code/User/snippets || :)
ln -s -f $(pwd)/vscode/snippets/python.json $HOME/.config/Code/User/snippets/python.json

