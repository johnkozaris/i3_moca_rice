#!/bin/bash
. input_elements.sh

# ----------------------------- Install packages ----------------------------- #

sudo pacman -S - <pacman-packages.txt

cd "$HOME" || exit

# Install antigen for zsh
curl -L git.io/antigen >antigen.zsh

# Make zsh default
chsh -s $(which zsh)

# Install base16 for colors
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Set auto timezone
timedatectl set-ntp true

# ----------------------------- Install Configurations ----------------------------- #


# ----------------------------- Install Cleanup ----------------------------- #