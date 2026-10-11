#!/bin/bash

sketchybar --add item wifi right \
           --set wifi \
                 background.color="$BG_SECONDARY" \
                 background.corner_radius=20 \
                 background.height=36 \
                 label.padding_left=5 \
                 update_freq=60 \
                 script="$PLUGIN_DIR/wifi.sh"

