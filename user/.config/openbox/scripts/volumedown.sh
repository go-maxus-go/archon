#!/bin/bash

volume="$(pactl list sinks | tr ' ' '\n' | grep -m1 '%' | tr -d '%')"
volume=$(($volume-5))

if [ "$volume" -lt 0 ]
then
    volume=0
fi

volume="$volume%"

pactl set-sink-volume @DEFAULT_SINK@ $volume
dunstify "Volume $volume" -u 0 -r 92347
