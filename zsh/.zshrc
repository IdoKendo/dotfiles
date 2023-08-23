# Starship init
eval "$(starship init zsh)"
# General aliases
alias ls="exa"
alias ll="exa -alh"
alias lt="exa --tree"
alias cat="bat -p"
alias k="kubectl"
alias vim="nvim"
# Git aliases
alias gst="git status"
alias gco="git checkout"
alias gaa="git add --all"
alias gcmsg="git commit -m"
alias gp="git push"
# ...
source $(brew --prefix nvm)/nvm.sh
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
create_session () { ~/session.sh }
zle -N create_session
bindkey '\C-f' create_session
autoload -Uz compinit && compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
