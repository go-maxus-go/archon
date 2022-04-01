import os
import sys

def calcTotalBrightness(brightness, maxBrightness, softBrightness):
    return int(round((10 * brightness / maxBrightness)) * 10 - 100 + 100 * softBrightness)

minBrightness = 1
minSoftBrightness = 0.2
midSoftBrightness = 1.0
maxSoftBrightness = 1.5

brightness, maxBrightness, softBrightness = sys.argv[1:4]

brightness = int(brightness)
maxBrightness = int(maxBrightness)
softBrightness = float(softBrightness)

displays = sys.argv[4:]

brightnessDelta = maxBrightness / 10
softBrightnessDelta = 0.1

brightness = max(minBrightness, min(brightness, maxBrightness))
softBrightness = max(minSoftBrightness, min(softBrightness, maxSoftBrightness))

if softBrightness < midSoftBrightness:
    newSoftBrightness = min(midSoftBrightness, softBrightness + softBrightnessDelta)

    for display in displays:
        command = "xrandr --output {0} --brightness {1}"
        os.system(command.format(display, newSoftBrightness))

    totalBrightness = calcTotalBrightness(brightness, maxBrightness, newSoftBrightness)
    os.system('dunstify "Brightness {0}%" -u 0 -r 92347'.format(totalBrightness))
elif brightness < maxBrightness:
    newBrightness = min(maxBrightness, brightness + brightnessDelta)
    os.system("brightnessctl s {0}".format(newBrightness))

    totalBrightness = calcTotalBrightness(newBrightness, maxBrightness, softBrightness)
    os.system('dunstify "Brightness {0}%" -u 0 -r 92347'.format(totalBrightness))
else:
    newSoftBrightness = min(maxSoftBrightness, softBrightness + softBrightnessDelta)

    for display in displays:
        command = "xrandr --output {0} --brightness {1}"
        os.system(command.format(display, newSoftBrightness))

    totalBrightness = calcTotalBrightness(brightness, maxBrightness, newSoftBrightness)
    os.system('dunstify "Brightness {0}%" -u 0 -r 92347'.format(totalBrightness))
