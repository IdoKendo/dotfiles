alias pyv="pyenv activate $(basename $(pwd))"
alias pyn="pyenv virtualenv 3.11 $(basename $(pwd))"
# lazy load pyenv
pyenv() {
  unset -f pyenv
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  pyenv $@
}
