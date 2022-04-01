import os
import sys
import math


def parseDevice(device):
    params = device.split(",")
    name = params[0]
    currValue = int(params[2])
    maxValue = int(params[4])
    return name, currValue, maxValue

def scale(value, maxValue):
    value = 255 * value / maxValue
    return math.log2(value)

def unscale(value, maxValue):
    value = 2 ** value
    return value * maxValue / 255

def calcScaledPercent(currValue, maxValue):
    currValue = scale(currValue, maxValue)
    maxValue = scale(maxValue, maxValue)
    return 10 * round(10 * currValue / maxValue + 0.5)

def calcNewValue(maxValue, newPercent):
    newValue = scale(maxValue, maxValue) * newPercent / 100
    return int(unscale(newValue, maxValue))

def setValue(deviceName, value):
    cmd = "brightnessctl --device={0} s {1}"
    os.system(cmd.format(deviceName, value))

isUp = sys.argv[1] == "up"
devices = sys.argv[2:]
devices = list(filter(lambda device: "backlight" in device, devices))

name, currValue, maxValue = parseDevice(devices[0])
currPercent = calcScaledPercent(currValue, maxValue)

newPercent = max(0, currPercent - 10)
if isUp:
    newPercent = min(100, currPercent + 10)

for device in devices:
    name, currValue, maxValue = parseDevice(device)
    newValue = calcNewValue(maxValue, newPercent)
    if newValue == currValue:
        if isUp:
            newValue = min(maxValue, currValue + 1)
        else:
            newValue = max(1, currValue - 1)
    setValue(name, newValue)

notificationCmd = 'dunstify "Brightness {0}%" -u 0 -r 92347'
os.system(notificationCmd.format(newPercent))
