#!/bin/bash

standard_packages=(
    i3-wm  # Windows Manager
    # Terminal
    alacritty  # Terminal
    bash-completion # terminal auto completion

    # Vim
    neovim  # Text editor

    rofi  # Application launcher
    dunst  # Notifications service
    nitrogen  # Wallpaper manager
    lxappearance  # Look and feel
    flameshot  # Screenshot

    # Terminal file manager
    ranger  # File manager
    w3m  # image preview
    trash-cli  # Trash bin for rander

    unclutter  # Automatically hide mouse cursor
    grub-customizer  # GUI for customizing GRUB
)

sudo apt install "${standard_packages[@]}"
