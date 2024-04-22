#!/usr/bin/env bash

dir="$HOME/.config/rofi/powermenu"
rofi_command="rofi -theme $dir/config.rasi"

# Options
shutdown="Shutdown"
hibernate="Hibernate"
reboot="Restart"
logout="Log Out"

options="$shutdown\n$hibernate\n$reboot\n$logout"

chosen="$(echo -e "$options" | $rofi_command -dmenu)"
case $chosen in
    $shutdown)
		shutdown now
        ;;
    $hibernate)
		systemctl hibernate
        ;;
    $reboot)
		systemctl reboot
        ;;
    $logout)
		if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
			openbox --exit
		elif [[ "$DESKTOP_SESSION" == "qtile" ]]; then
			qtile cmd-obj -o cmd -f shutdown
		elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
            i3-msg exit
		fi
        ;;
esac
