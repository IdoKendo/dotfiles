#!/usr/bin/env/zsh

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c="clear"
alias cat="bat -p"
alias k="kubecolor"
alias v="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"
alias vv="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias :q="exit"
alias idokendo="tmux new -s idokendo || tmux attach -t idokendo"
alias zshprof="time ZSH_DEBUGRC=1 zsh -i -c exit"
alias gcai="opencode -p \"write a git commit message for ONLY the staged changes (not the entire branch) and create a commit\" --agent commit-message-writer"

alias -s md='$EDITOR'
alias -s go='$EDITOR'
alias -s rs='$EDITOR'
alias -s py='$EDITOR'

if command -v wl-copy NUL; then
    alias -g CP='| wl-copy'
elif command -v pbcopy NUL; then
    alias -g CP='| pbcopy'
fi
