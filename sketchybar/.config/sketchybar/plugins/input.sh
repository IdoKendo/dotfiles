#!/bin/sh

plist_data=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources)
current_input_source=$(echo "$plist_data" | plutil -convert xml1 -o - - | grep -A1 'KeyboardLayout Name' | tail -n1 | cut -d '>' -f2 | cut -d '<' -f1)

if [ "$current_input_source" = "ABC" ]; then
    sketchybar --set input_source background.drawing=on label.color=0xff000000 label="A"
else
    sketchybar --set input_source background.drawing=on label.color=0xff000000 label="א"
fi
