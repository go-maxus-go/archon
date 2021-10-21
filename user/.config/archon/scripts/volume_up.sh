#!/bin/bash

sink="$(pactl get-default-sink)"
volume="$(pactl get-sink-volume $sink | tr ' ' '\n' | grep -m1 '%' | tr -d '%')"
volume=$(($volume+5))

if [ $volume -gt 125 ]
then
    volume=125
fi

volume=$(($volume / 5 * 5))
volume="$volume%"

if [ -z "$(pactl get-sink-mute @DEFAULT_SINK@ | grep no)" ]
then
    pactl set-sink-mute @DEFAULT_SINK@ false
fi

pactl set-sink-volume @DEFAULT_SINK@ $volume
dunstify "Volume $volume" -u 0 -r 92347
