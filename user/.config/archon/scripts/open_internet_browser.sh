#!/bin/bash

if command -v brave 2>&1 >/dev/null
then
    brave
else
    brave-browser
fi
