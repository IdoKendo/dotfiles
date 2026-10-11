#!/usr/bin/env zsh

wm_repo_name() {
  local common_dir repo
  common_dir=$(git rev-parse --path-format=absolute --git-common-dir 2>/dev/null) || return 1
  repo=${common_dir:t}

  case "$repo" in
    .git|.bare)
      repo=${common_dir:h:t}
      ;;
    *.git)
      repo=${repo%.git}
      ;;
  esac

  print -r -- "$repo"
}

wm_worktree_name() {
  local repo branch
  repo=$(wm_repo_name) || return 1
  branch=$(printf '%s' "$1" | tr '/' '-')
  printf '%s-%s\n' "$repo" "$branch"
}

wm_create_branch() {
  local branch name
  branch="$1"
  name=$(wm_worktree_name "$branch") || return 1
  workmux add "$branch" --name "$name"
}

wm_create_or_open_branch() {
  local branch name
  branch="$1"
  name=$(wm_worktree_name "$branch") || return 1
  workmux add "$branch" --name "$name" --open-if-exists
}

wm_create_prompt() {
  local prompt preview branch
  prompt="$1"
  preview=$(workmux add -A -p "$prompt" --dry-run --no-pane-cmds --no-hooks --no-file-ops) || return 1
  branch=$(printf '%s\n' "$preview" | awk '$1 == "Branch:" { print $2 }')
  [ -z "$branch" ] && return 1
  wm_create_branch "$branch"
}
