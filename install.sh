#!/bin/bash

# Install

# First update everything
sudo pacman -Rdd --noconfirm libdmx libxxf86dga
sudo pacman -Syyu --noconfirm --needed --noredownload --norebuild --skipchecksums --skippgpcheck &&
sudo pacman -Rdd --noconfirm xorgproto
yay -Syu --noconfirm --needed --noredownload --norebuild --skipchecksums --skippgpcheck

# Then install the necessary programs
get="yay -S --noconfirm --needed --noredownload --norebuild"
$get libreoffice-fresh &&
$get neovim &&
$get python &&
$get python-pip &&
pip install --user neovim &&
$get nvimpager-git &&
$HOME/.config/nvim/install.sh &&
$get rubygems &&
$get ruby-irb &&
$get i3lock &&
$get xidlehook 
