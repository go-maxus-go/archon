#!/bin/bash

dir=$(cd "$(dirname "$0")" && pwd)

cd $dir/brave
git pull origin master
makepkg -si --noconfirm
cd -
