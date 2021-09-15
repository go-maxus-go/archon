#!/bin/bash

sudo pacman --noconfirm -S python

python deploy.py

cp user/. ~/. -r