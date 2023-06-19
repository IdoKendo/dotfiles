eval "$(starship init zsh)"
alias ll="exa -la"
source $(brew --prefix nvm)/nvm.sh
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
create_session () { ~/session.sh }
zle -N create_session
bindkey '\C-f' create_session
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
