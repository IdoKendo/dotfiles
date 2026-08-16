#!/usr/bin/env zsh

source "${0:A:h}/create-common.sh"

printf 'Branch: '
read -r branch
[ -z "$branch" ] && exit 0
wm_create_branch "$branch" || { echo; echo "workmux add failed. Press any key to close."; read -n 1 -s; }
