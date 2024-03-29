export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/run/user/$UID"

export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export GOPATH="$XDG_DATA_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$CARGO_HOME/bin:$GOPATH/bin:$PATH"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export REDISCLI_HISTFILE="$XDG_DATA_HOME/redis/rediscli_history"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

export FCEDIT="nvim"
export KUBE_EDITOR="nvim"

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

. "$CARGO_HOME/env"
