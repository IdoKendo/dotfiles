#!/usr/bin/env zsh

for dir in ~/Work/*/; do
  git -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1 || continue

  git -C "$dir" fetch --quiet

  branch=$(git -C "$dir" branch --show-current)
  upstream=$(git -C "$dir" rev-parse --abbrev-ref '@{u}' 2>/dev/null) || continue
  behind=$(git -C "$dir" rev-list --count HEAD.."$upstream")

  (( behind > 0 )) && echo "${dir:t}: $branch is behind $upstream by $behind commits"
done
