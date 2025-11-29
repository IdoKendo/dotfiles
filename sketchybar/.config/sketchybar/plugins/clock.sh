#!/bin/sh

CYAN=0xff7dcfff
FG_DARK=0xffa9b1d6

sketchybar --set "$NAME" icon.color=$CYAN label.color=$FG_DARK label="$(date '+%Y-%m-%d %H:%M')"

