#!/usr/bin/env sh

[ -z "$1" ] && echo "No direction provided" && exit 1
delta="5 px or 5 ppt"

moveChoice() {
  success=$(i3-msg resize "$1" "$2" "$delta" | grep '"success":true')
  if [ -z $success ]
  then
    i3-msg resize "$3" "$4" "$delta"
  fi
}

case $1 in
  up)
    moveChoice grow up shrink down
    ;;
  down)
    moveChoice grow down shrink up
    ;;
  left)
    moveChoice grow left shrink right
    ;;
  right)
    moveChoice grow right shrink left
    ;;
esac
