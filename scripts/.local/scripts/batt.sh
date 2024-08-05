#!/bin/zsh

BATTERY_PCT=$(pmset -g batt | grep % | awk 'NR=1{print $3}' | cut -c 1-2)
if [[ ! "$BATTERY_PCT" ]] then
    BATTERY_PCT=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk 'NR=1{print $2}' | cut -c 1-2)
fi
BATTERY_ICON=""
if [[ $BATTERY_PCT -gt 90 ]] then
    BATTERY_ICON="󰁹"
elif [[ $BATTERY_PCT -gt 80 ]] then
    BATTERY_ICON="󰂂"
elif [[ $BATTERY_PCT -gt 70 ]] then
    BATTERY_ICON="󰂁"
elif [[ $BATTERY_PCT -gt 60 ]] then
    BATTERY_ICON="󰂀"
elif [[ $BATTERY_PCT -gt 50 ]] then
    BATTERY_ICON="󰁿"
elif [[ $BATTERY_PCT -gt 40 ]] then
    BATTERY_ICON="󰁾"
elif [[ $BATTERY_PCT -gt 30 ]] then
    BATTERY_ICON="󰁽"
elif [[ $BATTERY_PCT -gt 20 ]] then
    BATTERY_ICON="󰁼"
elif [[ $BATTERY_PCT -gt 10 ]] then
    BATTERY_ICON="󰁻"
else
    BATTERY_ICON="󰁺"
fi

echo "$BATTERY_ICON $BATTERY_PCT%"
