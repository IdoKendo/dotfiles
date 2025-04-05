export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/run/user/$UID"

export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export OPAMROOT="$XDG_DATA_HOME/opam"
case "$(uname -s)" in
    Linux*) UV_PYTHON_VER="cpython-3.12.4-linux-x86_64-gnu";;
    Darwin*) UV_PYTHON_VER="cpython-3.11.9-macos-aarch64-none";;
esac
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:/usr/local/opt/gnu-sed/libexec/gnubin:$CARGO_HOME/bin:$GOPATH/bin:$XDG_DATA_HOME/uv/python/$UV_PYTHON_VER/bin:$HOME/.local/bin:$PATH"
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
export PYTHONPATH="$PYTHONPATH:$(pwd)"
export REDISCLI_HISTFILE="$XDG_DATA_HOME/redis/rediscli_history"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export SQLITE_HISTORY="$XDG_CACHE_HOME/sqlite_history"
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

export FCEDIT="nvim"
export KUBE_EDITOR="nvim"

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
