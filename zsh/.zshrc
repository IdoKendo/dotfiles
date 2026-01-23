# =============================================================================
# Profiling (start) - measure zsh startup time when ZSH_DEBUGRC=1
# =============================================================================
if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zmodload zsh/zprof
fi

# =============================================================================
# History Settings - configure shell history behavior when atuin is not available
# =============================================================================
if ! (( ${+commands[atuin]} )); then
    export HISTFILE="$XDG_STATE_HOME/zsh/history"
    export SAVEHIST=1000
    export HISTSIZE=999
    setopt share_history
    setopt hist_expire_dups_first
    setopt hist_ignore_dups
    setopt hist_verify
fi

# =============================================================================
# Aliases - command shortcuts for common operations
# =============================================================================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c="clear"
alias cat="bat -p"
alias kubectl="kubecolor"
alias v="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"
alias vv="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias :q="exit"
alias idokendo="tmux new -s idokendo || tmux attach -t idokendo"
alias zshprof="time ZSH_DEBUGRC=1 zsh -i -c exit"

# =============================================================================
# Suffix Aliases - open files with default editor based on extension
# =============================================================================
alias -s md='$EDITOR'
alias -s go='$EDITOR'
alias -s rs='$EDITOR'
alias -s py='$EDITOR'

# =============================================================================
# Global Aliases - pipe and redirect shortcuts
# =============================================================================
alias -g NUL='&> /dev/null'

if (( ${+commands[wl-copy]} )); then
    alias -g CP='| wl-copy'
elif (( ${+commands[pbcopy]} )); then
    alias -g CP='| pbcopy'
fi

# =============================================================================
# Zinit Plugin Manager - installation and initialization
# =============================================================================
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# =============================================================================
# Zinit Plugins - load syntax highlighting, completions, autosuggestions
# =============================================================================
zinit wait lucid for \
    zsh-users/zsh-syntax-highlighting \
    zsh-users/zsh-completions \
    zsh-users/zsh-autosuggestions \
    Aloxaf/fzf-tab \
    MichaelAquilina/zsh-autoswitch-virtualenv

zinit ice lucid as"program" pick"bin/git-dsf"
zinit load so-fancy/diff-so-fancy

# =============================================================================
# Zinit Snippets - Oh My Zsh plugin manager snippets
# =============================================================================
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found
zinit snippet OMZP::eza
zinit snippet OMZP::git
zinit snippet OMZP::kubectl
zinit snippet OMZP::terraform
zinit snippet OMZP::tmux
zinit snippet OMZP::uv

# =============================================================================
# Completion Initialization - setup autocompletions
# =============================================================================
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
    compinit
done
compinit -C

# =============================================================================
# Kubectl Completions - kubecolor integration for kubectl
# =============================================================================
if (( ${+commands[kubectl]} )); then
    source <(kubectl completion zsh)
    compdef kubecolor=kubectl
fi

# =============================================================================
# Zinit Best Practices - replay commands and clean up
# =============================================================================
zinit cdreplay -q

# =============================================================================
# History Search Keybindings - search backward/forward with partial matches
# =============================================================================
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

# =============================================================================
# Completion Styling - configure completion menu appearance and behavior
# =============================================================================
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*:*:make:*:targets' call-command true
zstyle ':completion:*:*:make:*' tag-order 'targets'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'

# =============================================================================
# Additional Keybindings - editor, undo, and vi-mode bindings
# =============================================================================
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

bindkey '^x^u' undo

bindkey -M viins '^B' backward-char
bindkey -M vicmd '^B' backward-char
bindkey -s '^xgc' 'gc -m ""\C-b'

# =============================================================================
# Tmux Session Widget - quick tmux session creation/attachment
# =============================================================================
tmux-session () { ~/.local/scripts/session.sh }
zle -N tmux-session
bindkey "^F" tmux-session

# =============================================================================
# Shell Enhancements - atuin history search and starship prompt
# =============================================================================
eval "$(atuin init zsh)"
eval "$(starship init zsh)"

# =============================================================================
# Profiling (end) - output timing when ZSH_DEBUGRC=1
# =============================================================================
if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi
