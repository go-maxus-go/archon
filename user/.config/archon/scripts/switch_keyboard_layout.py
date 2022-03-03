#!/usr/bin/python

import os
import sys

layouts = sys.argv[1].split(',')
currLayout = sys.argv[2].split(',')[0]

splitIndex = 0
for i in range(len(layouts)):
    if layouts[i] == currLayout:
        splitIndex = i
        break

for i in range(splitIndex + 1):
    layouts.append(layouts.pop(0))

newLayout = ','.join(layouts)
os.system("setxkbmap -layout {0}".format(newLayout))

newLanguage = layouts[0].upper()
os.system("dunstify {0} -u 0 -r 92347".format(newLanguage))
