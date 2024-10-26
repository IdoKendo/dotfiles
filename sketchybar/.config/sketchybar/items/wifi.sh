#!/bin/sh

sketchybar --add item wifi right \
           --set wifi label.padding_left=5 update_freq=60 script="$PLUGIN_DIR/wifi.sh"
