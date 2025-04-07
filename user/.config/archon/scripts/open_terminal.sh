#!/bin/bash

terminal=kitty

if [ -z $@ ]
then
    $terminal
else
    $terminal -e $@
fi
