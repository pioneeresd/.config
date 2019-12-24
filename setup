#!/bin/bash
# Setup

# Copy my personal bin folder
rm -rf ~/.local/bin
git clone git@github.com:$USER/bin ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

cd ~/.config
gmerge .config

cd ~
gmerge dotfiles.git
. .bashrc

mkdir -p ~/Documents/github
mkdir -p ~/Documents/bitbucket
