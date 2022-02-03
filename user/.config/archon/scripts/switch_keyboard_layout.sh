#!/bin/bash

currLayout=$(setxkbmap -query | awk '/layout/ {print $2}')

# Get current language before comma
next=${currLayout#*,}
curr=${currLayout%"$next"}
curr=${curr::-1}

# Create new layout
newLayout="${next},${curr}"
setxkbmap $newLayout

# Get current language before comma
next=${newLayout#*,}
curr=${newLayout%"$next"}
curr=${curr::-1}
dunstify ${curr^^} -u 0 -r 92347
