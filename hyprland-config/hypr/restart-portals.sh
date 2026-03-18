#!/bin/bash
systemctl --user stop pipewire pipewire-pulse wireplumber

pkill -f xdg-desktop-portal
pkill -f xdg-desktop-portal-hyprland
sleep 1

systemctl --user start pipewire pipewire-pulse wireplumber

nohup /usr/lib/xdg-desktop-portal-hyprland > /dev/null 2>&1 &
nohup /usr/lib/xdg-desktop-portal > /dev/null 2>&1 &
notify-send "Pipewire" "Перезавантажився"
