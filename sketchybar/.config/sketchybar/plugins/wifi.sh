#!/bin/bash

INFO="$(en="$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')"; ipconfig getsummary "$en" | grep -Fxq "  Active : FALSE" || networksetup -listpreferredwirelessnetworks "$en" | sed -n '2s/^\t//p')"
IP="$(ipconfig getifaddr en0)"

ICON="$([ -n "$IP" ] && echo "" || echo "󱛅")"
LABEL="$([ -n "$IP" ] && echo "$INFO" || echo "Disconnected")"

sketchybar --set "$NAME" icon.color=0x44ffffff label.color=0x44ffffff icon="$ICON" label="$LABEL"
