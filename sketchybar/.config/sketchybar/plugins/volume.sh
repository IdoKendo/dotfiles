#!/bin/sh

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  case "$VOLUME" in
    [6-9][0-9]|100) ICON="󰕾"
    ;;
    [3-5][0-9]) ICON="󰖀"
    ;;
    [1-9]|[1-2][0-9]) ICON="󰕿"
    ;;
    *) ICON="󰖁"
  esac

  MAGENTA=0xffbb9af7
  FG_DARK=0xffa9b1d6

  sketchybar --set "$NAME" icon.color=$MAGENTA label.color=$FG_DARK icon="$ICON" label="$VOLUME%"
fi
