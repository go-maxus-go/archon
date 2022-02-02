#!/bin/bash

currLayout=$(setxkbmap -query | awk '/layout/ {print $2}')

newLayout=us
if [[ "$currLayout" == "us" ]]; then
   newLayout=ru
else
   newLayout=us
fi

setxkbmap $newLayout
dunstify  ${newLayout^^} -u 0 -r 92347
