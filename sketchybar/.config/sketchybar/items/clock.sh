#!/bin/bash

source "$ITEMS_DIR/right_shared.sh"

sketchybar --add item clock right \
           --set clock update_freq=10 \
                  icon= \
                  script="$PLUGIN_DIR/clock.sh" \
                  background.color="$RIGHT_BG_COLOR" \
                  background.corner_radius="$RIGHT_CORNER_RADIUS" \
                  background.height="$RIGHT_ITEM_HEIGHT" \
                  background.blur_radius="$RIGHT_BLUR_RADIUS" \
                  background.padding_left="$RIGHT_PADDING" \
                  background.padding_right="$RIGHT_PADDING"
