#!/bin/bash

# Preconfig
if [ $USER == 'jhessin' ]; then
  localectl set-keymap --no-convert dvorak-programmer
fi

yay -Syy --noconfirm xclip

if [ ! -e ~/.ssh/id_rsa.pub ]; then
  ssh-keygen -f ~/.ssh/id_rsa -q -N ""
  eval `ssh-agent`
  ssh-add ~/.ssh/id_rsa
fi

cat ~/.ssh/id_rsa.pub | xclip -sel clip
echo "Please paste SSH key into github."
echo "Then run: 
curl https://raw.githubusercontent.com/$USER/.config/master/keysetup.sh | bash"

