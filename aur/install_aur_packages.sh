#!/bin/bash

dir=$(cd "$(dirname "$0")" && pwd)

packages=(brave)

for package in ${packages[@]}; do
	cd $dir/$package
	git pull origin master
	makepkg -si --noconfirm
	cd -
done
