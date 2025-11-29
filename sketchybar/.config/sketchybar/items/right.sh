#!/bin/bash

sketchybar --add item clock right \
           --set clock update_freq=10 icon= script="$PLUGIN_DIR/clock.sh" \
           --add item volume right \
           --set volume script="$PLUGIN_DIR/volume.sh" \
           --subscribe volume volume_change \
           --add item battery right \
           --set battery update_freq=120 script="$PLUGIN_DIR/battery.sh" \
           --subscribe battery system_woke power_source_change

sketchybar --add bracket right_pill_bg clock volume battery \
           --set right_pill_bg background.color="$BG_SECONDARY" \
                              background.corner_radius=20 \
                              background.height=36 \
                              background.padding_left=3 \
                              background.padding_right=3 \
                              background.blur_radius=20

