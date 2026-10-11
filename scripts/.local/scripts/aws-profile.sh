#!/usr/bin/env bash

set -euo pipefail

if [[ $# -eq 2 && $1 == popup ]]; then
    tmux display-popup -t "$2" -h 40% -w 60% -E "$0 select '$2'"
    exit 0
fi

if [[ $# -ne 2 || $1 != select ]]; then
    printf 'Usage: %s popup|select PANE_ID\n' "$0" >&2
    exit 2
fi

if command -v aws >/dev/null 2>&1; then
    profiles_command=(aws configure list-profiles)
elif command -v mise >/dev/null 2>&1; then
    profiles_command=(mise exec -- aws configure list-profiles)
else
    printf 'aws CLI is not installed.\n' >&2
    exit 1
fi

profile=$("${profiles_command[@]}" | fzf --prompt='AWS profile > ') || exit 0
printf -v quoted_profile '%q' "$profile"
tmux send-keys -t "$2" -l "export AWS_PROFILE=$quoted_profile; printf '\\033[1A\\033[2K\\r'"
tmux send-keys -t "$2" Enter
