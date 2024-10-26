#!/bin/bash

apple_logo=(
  icon=""
  icon.font="$FONT:Bold:20.0"
  icon.color=0x44ffffff
  padding_right=15
  label.drawing=off
  popup.height=35
)

sketchybar --add item apple.logo left --set apple.logo "${apple_logo[@]}"
