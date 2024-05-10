#!/bin/bash

sudo pacman --noconfirm -Syu
sudo pacman --noconfirm -S python

dir=$(cd "$(dirname "$0")" && pwd)
sh $dir/aur/install_aur_packages.sh

python $dir/install_packages.py
sh $dir/copy_configs.sh
sh $dir/aur/install_aur_packages.sh
