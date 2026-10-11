#!/bin/bash

source "$ITEMS_DIR/right_shared.sh"

sketchybar --add item volume right \
           --set volume script="$PLUGIN_DIR/volume.sh" \
                  background.color="$RIGHT_BG_COLOR" \
                  background.corner_radius="$RIGHT_CORNER_RADIUS" \
                  background.height="$RIGHT_ITEM_HEIGHT" \
                  background.blur_radius="$RIGHT_BLUR_RADIUS" \
                  background.padding_left="$RIGHT_PADDING" \
                  background.padding_right="$RIGHT_PADDING" \
           --subscribe volume volume_change mouse.scrolled mouse.clicked
