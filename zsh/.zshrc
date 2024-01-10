# Starship init
eval "$(starship init zsh)"
# General aliases
alias ls="exa"
alias ll="exa -alh"
alias lt="exa --tree"
alias cat="bat -p"
alias k="kubectl"
alias vim="nvim"
alias :q="exit"
# Git aliases
alias gst="git status"
alias gco="git checkout"
alias gaa="git add --all"
alias gcm="git commit -m"
alias gp="git push"
# Custom aliases
alias idokendo="tmux new -s idokendo || tmux attach -t idokendo"
alias pyv="pyenv activate $(basename $(pwd))"
alias pyn="pyenv virtualenv 3.11 $(basename $(pwd))"
# lazy load pyenv
pyenv() {
  unset -f pyenv
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  pyenv $@
}
# load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# load nvm
source $(brew --prefix nvm)/nvm.sh
# bind create session script
create_session () { ~/.local/scripts/session.sh }
zle -N create_session
bindkey '\C-f' create_session
# load compinit
autoload -Uz compinit && compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
# load thefuck
eval $(thefuck --alias)
