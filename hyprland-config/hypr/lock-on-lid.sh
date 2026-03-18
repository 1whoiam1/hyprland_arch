#!/bin/bash

# Затримка для того, щоб не блокувати одразу
sleep 1

# Запуск hyprlock від користувача
su - user -c "DISPLAY=:wayland-1 WAYLAND_DISPLAY=wayland-1 hyprlock"

