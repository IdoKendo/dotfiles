#!/bin/bash

INFO="$(system_profiler SPAirPortDataType | awk '/Current Network/ {getline;$1=$1;print $0 | "tr -d ':'";exit}')"
IP="$(ipconfig getifaddr en0)"

ICON="$([ -n "$IP" ] && echo "" || echo "󱛅")"
LABEL="$([ -n "$IP" ] && echo "$INFO" || echo "Disconnected")"

sketchybar --set $NAME icon.color=0x44ffffff label.color=0x44ffffff icon="$ICON" label="$LABEL"
