#!/bin/bash

sudo pacman --noconfirm -Syu
sudo pacman --noconfirm -S python

dir=$(cd "$(dirname "$0")" && pwd)
cd $dir
git submodule update --init --recursive
cd -

sudo python $dir/install_packages.py
sh $dir/aur/install_aur_packages.sh
sudo sh $dir/setlayout/deploy.sh
sh $dir/copy_configs.sh
