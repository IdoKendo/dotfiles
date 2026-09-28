#!/bin/bash

BG_SECONDARY=0xff16161e
BLUE=0xff7aa2f7

focused_space=${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}

if [[ "$1" = "$focused_space" ]]; then
    sketchybar --set "$NAME" background.drawing=on label.color=$BG_SECONDARY label="$1"
else
    sketchybar --set "$NAME" background.drawing=off label.color=$BLUE label="$1"
fi
