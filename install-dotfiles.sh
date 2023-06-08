#!/bin/bash
if [[ -d ~/.git ]]; then
    echo "Home already initialized as repository!"
    echo "Pulling latest..."
    git pull
else
    echo "Initializing home as repository..."
    cd ~
    git init
    git remote add origin https://github.com/JamFox/dotfiles.git
    git fetch
    git checkout -f main
fi
