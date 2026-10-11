#!/bin/bash

INFO="$(en="$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')"; ipconfig getsummary "$en" | grep -Fxq "  Active : FALSE" || networksetup -listpreferredwirelessnetworks "$en" | sed -n '2s/^\t//p')"
IP="$(ipconfig getifaddr en0)"

ICON="$([ -n "$IP" ] && echo "" || echo "󱛅")"
LABEL="$([ -n "$IP" ] && echo "$INFO" || echo "Disconnected")"

GREEN=0xff9ece6a
RED=0xfff7768e
FG_DARK=0xffa9b1d6

if [ -n "$IP" ]; then
  COLOR=$GREEN
else
  COLOR=$RED
fi

sketchybar --set "$NAME" icon.color=$COLOR label.color=$FG_DARK icon="$ICON" label="$LABEL"
