case "$(uname -s)" in
    Linux*) 
        BATTERY_DEVICES=$(upower -e 2>/dev/null | grep battery)
        VALID_BATTERY=""

        for device in $BATTERY_DEVICES; do
            DEVICE_INFO=$(upower -i "$device" 2>/dev/null)
            if echo "$DEVICE_INFO" | grep -q "power supply: yes"; then
                VALID_BATTERY="$device"
                BATTERY_INFO="$DEVICE_INFO"
                break
            fi
        done

        if [[ -z "$VALID_BATTERY" ]]; then
            echo "󰚥 AC"
            exit 0
        fi

        BATTERY_PCT=$(echo "$BATTERY_INFO" | grep percentage | awk 'NR=1{print $2}' | sed 's/%//')
        ;;
    Darwin*) BATTERY_PCT=$(pmset -g batt | grep % | awk 'NR=1{print $3}' | sed 's/%;//');;
esac
BATTERY_ICON=""
if [[ $BATTERY_PCT -gt 90 ]]; then
    BATTERY_ICON="󰁹"
elif [[ $BATTERY_PCT -gt 80 ]]; then
    BATTERY_ICON="󰂂"
elif [[ $BATTERY_PCT -gt 70 ]]; then
    BATTERY_ICON="󰂁"
elif [[ $BATTERY_PCT -gt 60 ]]; then
    BATTERY_ICON="󰂀"
elif [[ $BATTERY_PCT -gt 50 ]]; then
    BATTERY_ICON="󰁿"
elif [[ $BATTERY_PCT -gt 40 ]]; then
    BATTERY_ICON="󰁾"
elif [[ $BATTERY_PCT -gt 30 ]]; then
    BATTERY_ICON="󰁽"
elif [[ $BATTERY_PCT -gt 20 ]]; then
    BATTERY_ICON="󰁼"
elif [[ $BATTERY_PCT -gt 10 ]]; then
    BATTERY_ICON="󰁻"
else
    BATTERY_ICON="󰁺"
fi

echo "$BATTERY_ICON ${BATTERY_PCT}%"
