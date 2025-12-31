#!/usr/bin/env zsh

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

bindkey '^x^u' undo

bindkey -M viins '^B' backward-char
bindkey -M vicmd '^B' backward-char
bindkey -s '^xgc' 'gc -m ""\C-b'
