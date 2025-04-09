#!/bin/bash

devices="$(brightnessctl -lm)"

dir=$(cd "$(dirname "$0")" && pwd)

python3 $dir/change_brightness.py down $devices
