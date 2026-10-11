#!/bin/sh

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"
  MUTE_STATUS=$(osascript -e 'get volume settings' | grep -o 'muted:[a-z]*' | cut -d':' -f2)

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
  RED=0xfff7768e
  FG_DARK=0xffa9b1d6

  if [ "$MUTE_STATUS" = "true" ]; then
    sketchybar --set "$NAME" icon.color=$RED label.color=$RED icon="$ICON" label="muted"
  else
    sketchybar --set "$NAME" icon.color=$MAGENTA label.color=$FG_DARK icon="$ICON" label="$VOLUME%"
  fi
elif [ "$SENDER" = "mouse.clicked" ] && [ "$BUTTON" = "right" ]; then
  CURRENT_MUTE=$(osascript -e 'get volume settings' | grep -o 'muted:[a-z]*' | cut -d':' -f2)

  if [ "$CURRENT_MUTE" = "false" ]; then
    osascript -e 'set volume output muted true'
  else
    osascript -e 'set volume output muted false'
  fi

  sketchybar --trigger volume_change
elif [ "$SENDER" = "mouse.scrolled" ]; then
  CURRENT_VOLUME=$(osascript -e 'get volume settings' | grep -o '[0-9]\+' | head -1)

  if [ "$SCROLL_DELTA" -gt 0 ]; then
    NEW_VOLUME=$((CURRENT_VOLUME + 5))
    [ "$NEW_VOLUME" -gt 100 ] && NEW_VOLUME=100
  else
    NEW_VOLUME=$((CURRENT_VOLUME - 5))
    [ "$NEW_VOLUME" -lt 0 ] && NEW_VOLUME=0
  fi

  osascript -e "set volume output volume $NEW_VOLUME"
  sketchybar --trigger volume_change
fi
