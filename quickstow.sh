#!/bin/bash
echo 1. Apply dotfiles
echo 2. Apply gnome-terminal profiles
echo :
read -r answer

if [[ $answer -eq 1 ]]; then
    echo Applying dotfiles..
    stow -S nvim tmux zsh alacritty
elif [[ $answer -eq 2 ]]; then
    echo Applying gnome-terminal profiles
    dconf load /org/gnome/terminal/legacy/profiles:/ <gnome-terminal-profiles.dconf
fi
