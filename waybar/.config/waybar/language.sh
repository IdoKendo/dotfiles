#!/usr/bin/env bash

LAYOUT=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap' | cut -d'(' -f1 | tr '[:lower:]' '[:upper:]')
echo "${LAYOUT:0:2}"
