import os
import sys
import math


def parseDevice(device):
    params = device.split(",")
    name = params[0]
    value = int(params[3].split("%")[0])
    return name, value

def setValue(deviceName, value):
    cmd = "brightnessctl --device={0} s {1}%"
    if value == 0:
        value = 1
        cmd = cmd[:-1]
    os.system(cmd.format(deviceName, value))

def increaseValue(value):
    if value < 10:
        value = max(value, 0)
        value += 1
    elif value < 50:
        value = 5 * (int(value / 5) + 1)
        value = min(value, 50)
    else:
        value = 10 * (int(value / 10) + 1)
        value = min(value, 100)
    return value

def decreaseValue(value):
    if value <= 10:
        value -= 1
        value = max(value, 0)
    elif value <= 50:
        value = 5 * (int(value / 5) - 1)
        value = max(value, 10)
    else:
        value = 10 * (int(value / 10) - 1)
        value = min(value, 100)
    return value

isUp = sys.argv[1] == "up"
devices = list(filter(lambda device: "backlight" in device, sys.argv[2:]))

name, value = parseDevice(devices[0])
if isUp:
    value = increaseValue(value)
else:
    value = decreaseValue(value)

for device in devices:
    name, _ = parseDevice(device)
    setValue(name, value)

notificationCmd = 'dunstify "Brightness {0}%" -u 0 -r 92347'
os.system(notificationCmd.format(value))
