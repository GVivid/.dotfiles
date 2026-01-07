#!/bin/sh

# Requires: swaybg, dmenu, and a Wallpapers folder.
pkill sway; wallpaper=$(find "$HOME/Wallpapers" -maxdepth 1 -type f -printf "%p\n" | dmenu); swaybg -m fill -i $wallpaper
