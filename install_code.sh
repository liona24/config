#!/bin/bash

cp vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
cp vscode/settings.json $HOME/.config/Code/User/settings.json

(mkdir -p $HOME/.config/Code/User/snippets || :)
cp vscode/snippets/python.json $HOME/.config/Code/User/snippets/python.json

