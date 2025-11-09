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
