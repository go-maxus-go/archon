#!/usr/bin/env bash

devices="$(brightnessctl -lm)"

dir=$(cd "$(dirname "$0")" && pwd)

python $dir/change_brightness.py down $devices
