#!/bin/bash

# Right-side items are placed right to left.
workmux_part=(drawing=off padding_left=0 padding_right=0)
sketchybar --add item workmux.done right \
           --set workmux.done "${workmux_part[@]}" icon="✓" icon.color="$GREEN" label.color="$GREEN" \
                 updates=on update_freq=5 script="$PLUGIN_DIR/workmux.sh" \
           --add item workmux.working right \
           --set workmux.working "${workmux_part[@]}" icon="…" icon.color="$ORANGE" label.color="$ORANGE" \
           --add item workmux.waiting right \
           --set workmux.waiting "${workmux_part[@]}" icon="?" icon.color="$RED" label.color="$RED" \
           --add bracket workmux workmux.waiting workmux.working workmux.done \
           --set workmux drawing=off background.color="$BG_SECONDARY" \
                 background.height=36 background.corner_radius=20
