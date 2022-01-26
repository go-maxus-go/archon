#!/bin/bash

if [ -z $@ ]
then
    alacritty
else
    alacritty -e $@
fi
