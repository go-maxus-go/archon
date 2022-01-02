#!/usr/bin/env bash

dir="$HOME/.config/rofi/powermenu"
rofi_command="rofi -theme $dir/config.rasi"

# Options
shutdown="Shutdown"
reboot="Restart"
logout="Log Out"

options="$shutdown\n$reboot\n$logout"

chosen="$(echo -e "$options" | $rofi_command -dmenu)"
case $chosen in
    $shutdown)
		shutdown now
        ;;
    $reboot)
		systemctl reboot
        ;;
    $logout)
		if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
			openbox --exit
		elif [[ "$DESKTOP_SESSION" == "qtile" ]]; then
			qtile cmd-obj -o cmd -f shutdown
		fi
        ;;
esac
