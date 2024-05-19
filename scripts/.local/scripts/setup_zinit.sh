# clone zinit if not installed
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# load zinit
source "${ZINIT_HOME}/zinit.zsh"

# plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# snippets
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found
zinit snippet OMZP::eza
zinit snippet OMZP::git
zinit snippet OMZP::pip
zinit snippet OMZP::sudo
zinit snippet OMZP::tmux

# load autocompletions
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
    compinit
done
compinit -C

# zinit best practices
zinit cdreplay -q

# Keybindings
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'
