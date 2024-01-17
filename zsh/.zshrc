# Starship init
eval "$(starship init zsh)"
# load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# load nvm
source $(brew --prefix nvm)/nvm.sh
# source scripts
source ~/.local/scripts/misc_aliases.sh
source ~/.local/scripts/git_aliases.sh
source ~/.local/scripts/setup_pyenv.sh
source ~/.local/scripts/bind_session.sh
source ~/.local/scripts/autocomplete.sh
# opam configuration
[[ ! -r ~/.opam/opam-init/init.zsh ]] || source ~/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
# load thefuck
eval $(thefuck --alias)
