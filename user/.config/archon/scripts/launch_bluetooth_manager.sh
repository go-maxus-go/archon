#!/bin/bash

pid=$(pidof blueberry)
if [ -z "$pid" ]
then
    bluetoothctl -- power on && blueberry
    for i in {1..10}; do
        sleep 1
        pid=$(pidof blueberry)
        if [ -z "$pid" ]
        then
            :
        else
            tail --pid=$pid -f /dev/null
            break
        fi
    done
    bluetoothctl -- power off
else
    blueberry
fi