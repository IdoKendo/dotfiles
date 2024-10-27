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

set-long-prompt() { PROMPT=$(starship prompt) }
precmd_functions=(set-long-prompt)

set-short-prompt() {
  if [[ $PROMPT != '%# ' ]]; then
    PROMPT="$(starship prompt --profile transient)"
    zle .reset-prompt 2>/dev/null # hide the errors on ctrl+c
  fi
}

zle-line-finish() { set-short-prompt }
zle -N zle-line-finish

trap 'set-short-prompt; return 130' INT

# conditionally profile zsh startup time
if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi
