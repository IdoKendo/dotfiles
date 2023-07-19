eval "$(starship init zsh)"
alias ls="exa"
alias ll="exa -alh"
alias lt="exa --tree"
alias cat="bat -p"
source $(brew --prefix nvm)/nvm.sh
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
create_session () { ~/session.sh }
zle -N create_session
bindkey '\C-f' create_session
autoload -Uz compinit && compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
