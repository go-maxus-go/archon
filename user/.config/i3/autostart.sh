#!/bin/bash

function run {
    if ! pgrep $1 > /dev/null ;
    then
        $@&
    fi
}

run setxkbmap -layout us &
run dunst &
run light-locker --lock-on-lid &
# run picom --experimental-backends &

# restore wallpaper if config folder exists
user_home=$(eval echo "~$different_user")
if [ -f "$user_home/.config/nitrogen/bg-saved.cfg" ]
then
    run nitrogen --restore &
else
    run nitrogen --set-zoom-fill ~/.config/archon/wallpapers/default.jpg &
fi
