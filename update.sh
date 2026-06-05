#!/bin/bash

rm config/* -r
rm zsh/* -r

cp ~/.config/alacritty config/ -r
cp ~/.config/btop config/ -r
cp ~/.config/cava config/ -r
cp ~/.config/fuzzel config/ -r
cp ~/.config/fastfetch/ config/ -r
cp ~/.config/gtk-3.0 config/ -r
cp ~/.config/gtk-4.0 config/ -r
cp ~/.config/htop config/ -r
cp ~/.config/niri config/ -r
cp ~/.config/nvim config/ -r
cp ~/.config/sway config/ -r
cp ~/.config/swaylock config/ -r
cp ~/.config/swaync config/ -r
# cp ~/.config/Vencord config/ -r
mkdir config/Vencord
cp ~/.config/vesktop/settings/ config/Vencord/ -r
cp ~/.config/vesktop/themes/ config/Vencord/ -r
cp ~/.config/waybar config/ -r
cp ~/.config/wlogout config/ -r
cp ~/.config/wpaperd config/ -r
cp ~/.config/xdg-desktop-portal-wlr/ config/ -r
cp ~/.config/yazi config/ -r

cp ~/.zshrc zsh/ -r
cp ~/.oh-my-zsh/themes/cocos-theme.zsh-theme zsh/ -r
