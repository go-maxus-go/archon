#!/bin/bash

sudo pacman --noconfirm -S python

python install_packages.py

cp user/. ~/. -r