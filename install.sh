#!/bin/bash

# Install

# First update everything
sudo pacman -Rdd libdmx libxxf86dga &&
yay -Syu --noconfirm &&
sudo pacman -Rdd xorgproto

# Then install the necessary programs
get="yay -Syy --noconfirm"
$get libreoffice-fresh
$get neovim
$get python-pip
pip install --user neovim
$get i3lock
$get rubygems
$get ruby-irb

$HOME/.config/nvim/install.sh
