#!/bin/bash

standard_packages=(
    # Windows Manager
    i3-wm  # Windows Manager
    python3-i3ipc  # For autosplit script

    # Fonts
    fonts-dejavu
    fonts-roboto
    fonts-font-awesome

    # Terminal
    # alacritty  # Don't use it because of an annoying bug with long lines
    kitty  # Terminal
    bash-completion # terminal auto completion

    # Terminal file manager
    ranger  # File manager
    w3m  # image preview

    trash-cli  # Trash bin for rander

    neovim  # Text editor

    rofi  # Application launcher
    dunst  # Notifications service
    nitrogen  # Wallpaper manager
    lxappearance  # Look and feel
    flameshot  # Screenshot

    unclutter  # Automatically hide mouse cursor
    grub-customizer  # GUI for customizing GRUB
    brightnessctl  # CLI for changing brightness
    curl  # CLI for transferring data
    gitk  # UI for git
    gsimplecal  # Calendar
)

sudo apt install "${standard_packages[@]}"

# Install Brave browser
curl -fsS https://dl.brave.com/install.sh | sh

# Install Ghostty terminalvidia (GL) drivers
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
