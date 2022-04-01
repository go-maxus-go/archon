#!/bin/bash

brightness="$(brightnessctl g)"
maxBrightness="$(brightnessctl m)"
softBrightness=$(xrandr --verbose | awk '/Brightness/ { print $2; exit }')

displays=$(xrandr | grep " connected" | sed  "s/connected/\n/" | grep "^[^()]*$")

dir=$(cd "$(dirname "$0")" && pwd)
python $dir/brightness_down.py $brightness $maxBrightness $softBrightness $displays