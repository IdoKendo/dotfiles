#!/bin/sh

sketchybar --add item input_source right \
           --set input_source \
                 update_freq=1 \
                 background.color=0x44ffffff \
                 background.corner_radius=5 \
                 background.height=20 \
                 background.drawing=off \
                 label.padding_right=10 \
                 script="$PLUGIN_DIR/input.sh"
