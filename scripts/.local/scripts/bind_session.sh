#!/usr/bin/env zsh
tmux-session () { ~/.local/scripts/session.sh }
zle -N tmux-session
bindkey "^F" tmux-session
