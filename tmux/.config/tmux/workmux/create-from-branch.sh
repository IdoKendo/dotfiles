#!/usr/bin/env zsh

source "${0:A:h}/create-common.sh"

if ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo "Not a git repository"
  echo "Press any key to close."
  read -n 1 -s
  exit 1
fi

selection=$(git for-each-ref --format='%(refname:short)' refs/heads refs/remotes | \
  grep -v '/HEAD$' | \
  fzf)
[ -z "$selection" ] && exit 0

wm_create_or_open_branch "$selection" || { echo; echo "workmux add failed. Press any key to close."; read -n 1 -s; }
