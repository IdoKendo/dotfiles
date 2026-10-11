#!/bin/bash

sketchybar --add event aerospace_workspace_change

WORKSPACES=$(aerospace list-workspaces --all)
AGGREGATED=$(echo "$WORKSPACES" | awk '{print "space." NR}' | paste -sd ' ' -)

for sid in $WORKSPACES; do
    sketchybar --add item space."$sid" left \
        --subscribe space."$sid" aerospace_workspace_change \
        --set space."$sid" \
        background.color="$BLUE" \
        background.corner_radius=20 \
        background.height=20 \
        background.drawing=off \
        background.padding_left=3 \
        background.padding_right=3 \
        icon.drawing=off \
        label="$sid" \
        label.color="$FG_DARK" \
        click_script="aerospace workspace $sid" \
        script="$PLUGIN_DIR/aerospace.sh $sid"
done

sketchybar --add item front_app left \
    --set front_app \
        label="$(aerospace list-windows --focused --format '%{app-name}' 2>/dev/null)" \
        script="sketchybar --set \"\$NAME\" label=\"\$(\"$(command -v aerospace)\" list-windows --focused --format '%{app-name}' 2>/dev/null)\"" \
    --subscribe front_app front_app_switched aerospace_workspace_change

sketchybar --add bracket left_pill_bg apple_logo $AGGREGATED front_app \
           --set left_pill_bg background.color="$BG_SECONDARY" \
                              background.corner_radius=20 \
                              background.height=36 \
                              background.padding_left=3 \
                              background.padding_right=3 \
                              background.blur_radius=20
