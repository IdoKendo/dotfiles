#!/usr/bin/env bash

choice=$(printf 'management\nproduction\n' | fzf) || exit 0
[ -n "$choice" ] || exit 0

python3 "$HOME/Work/kompass-debugging/debugging_tools/miscellaneous/ovpn/ovpn.py" -c "$choice"
result=$?
printf '\nVPN command exited with status %s. Press Enter to close.' "$result"
read -r _
exit "$result"
