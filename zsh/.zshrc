# conditionally profile zsh startup time
if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zmodload zsh/zprof
fi
# starship init
eval "$(starship init zsh)"
# source scripts
source ~/.local/scripts/misc_aliases.sh
source ~/.local/scripts/setup_history.sh
source ~/.local/scripts/bind_session.sh
source ~/.local/scripts/setup_zinit.sh
# atuin init
eval "$(atuin init zsh)"
# conditionally profile zsh startup time
if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi
