#!/bin/bash

packages=(
    https://aur.archlinux.org/brave-bin.git
    https://aur.archlinux.org/nomacs.git
    https://aur.archlinux.org/optimus-manager.git
    https://aur.archlinux.org/optimus-manager-qt.git
)

mkdir ~/AUR
for package in ${packages[@]}; do
    basename=$(basename $package)
    repo_name=${basename%.*}
    package_dir=~/AUR/$repo_name

    git clone $package $package_dir || (cd $package_dir ; git pull)
    (cd ~/AUR/$repo_name && makepkg -si --noconfirm)
done