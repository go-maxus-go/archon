#!/bin/bash


sudo pacman --noconfirm -S python

python install_packages.py

dir=$(cd "$(dirname "$0")" && pwd)

cp $dir/user/. ~/. -r

sh $dir/setlayout/deploy.sh
