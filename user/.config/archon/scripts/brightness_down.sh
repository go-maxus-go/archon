#!/bin/bash

maxBrightness="$(brightnessctl m)"
minBrightness=1

currBrightness="$(brightnessctl g)"
newBrightness=$(($currBrightness-$maxBrightness*5/100))

if [ "$newBrightness" -lt "$minBrightness" ]
then
    newBrightness=$minBrightness
fi

if [ "$newBrightness" -gt "$maxBrightness" ]
then
    newBrightness=$maxBrightness
fi

newBrightnessPercent=$((100*$newBrightness/$maxBrightness))

brightnessctl s $newBrightness
dunstify "Brightness $newBrightnessPercent%" -u 0 -r 92347