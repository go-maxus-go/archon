#!/bin/bash

function run {
    if ! pgrep $1 > /dev/null ;
    then
        $@&
    fi
}

# run tint2 &
run setxkbmap -layout "us,ru" -option "grp:caps_toggle" &
run dunst &

# restore wallpaper if config folder exists
user_home=$(eval echo "~$different_user")
if [ -f "$user_home/.config/nitrogen/bg-saved.cfg" ]
then
    run nitrogen --restore &
else
    run nitrogen --set-zoom-fill ~/.config/archon/wallpapers/default.jpg &
fi
