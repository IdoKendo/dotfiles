eval "$(starship init zsh)"
alias ll="exa -la"
source $(brew --prefix nvm)/nvm.sh
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
create_session () { ~/session.sh }
zle -N create_session
bindkey '\C-f' create_session
autoload -Uz compinit && compinit
