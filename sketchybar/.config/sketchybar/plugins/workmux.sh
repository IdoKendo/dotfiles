#!/bin/bash

export PATH="/run/current-system/sw/bin:$PATH"
# tmux replaces workmux's pane-field separators in a non-UTF-8 locale.
export LC_ALL=en_US.UTF-8
set -o pipefail

counts=$(workmux status --all --json | jq -r '
  [.agents[] | select(.agent_kind == "opencode")] |
  [(map(select(.status == "waiting")) | length),
   (map(select(.status == "working")) | length),
   (map(select(.status == "done" and .elapsed_secs < 300 and .elapsed_secs != null)) | length)]
  | @tsv
') || counts="0 0 0"

read -r waiting working done_count <<< "$counts"
args=()
part() {
  if (( $2 > 0 )); then
    args+=(--set "workmux.$1" drawing=on label="$2")
  else
    args+=(--set "workmux.$1" drawing=off)
  fi
}
part waiting "$waiting"
part working "$working"
part done "$done_count"
visible=off
(( waiting + working + done_count > 0 )) && visible=on
sketchybar "${args[@]}" --set workmux drawing="$visible"
