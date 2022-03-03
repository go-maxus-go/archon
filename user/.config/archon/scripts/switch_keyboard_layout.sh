#!/bin/bash

layouts="us,ru"
currLayout=$(setxkbmap -query | awk '/layout/ {print $2}')

dir=$(cd "$(dirname "$0")" && pwd)
python3 $dir/switch_keyboard_layout.py $layouts $currLayout
