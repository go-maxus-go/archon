#!/bin/bash

terminal=ghostty

if [ -z $@ ]
then
    $terminal
else
    $terminal -e $@
fi
