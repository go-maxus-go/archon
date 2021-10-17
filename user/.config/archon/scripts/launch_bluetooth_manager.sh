pid=$(pgrep blueman-manager)
isNumber='^[0-9]+$'
if ! [[ $pid =~ $isNumber ]] ; then
    bluetoothctl -- power on &&
    blueman-manager &&
    bluetoothctl -- power off &&
    pkill blueman-*
else
    blueman-manager
fi