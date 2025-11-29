#!/bin/bash

BG_SECONDARY=0xff16161e
BLUE=0xff7aa2f7

if [[ -z "$FOCUSED_WORKSPACE" ]]; then
    focused_space=$(aerospace list-workspaces --focused)
    sketchybar --set space."$focused_space" background.drawing=on label.color=$BG_SECONDARY label="$focused_space [$(aerospace list-windows --workspace focused | wc -l | grep -Eo '\d')]"
elif [[ "$1" = "$FOCUSED_WORKSPACE" ]]; then
    sketchybar --set "$NAME" background.drawing=on label.color=$BG_SECONDARY label="$1 [$(aerospace list-windows --focused | awk -F '|' '{print $2}' | xargs)]"
else
    sketchybar --set "$NAME" background.drawing=off label.color=$BLUE label="$(echo $NAME | grep -Eo '[0-9]{1,4}')"
fi
