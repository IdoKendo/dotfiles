{ config, pkgs, unstable, ... }:
let zshenv = ''
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
    export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
    export PATH="$GOPATH/bin:$PATH"
    export PYTHONPATH="$PYTHONPATH:$(pwd)"

    export FCEDIT="nvim"
  '';
in
{
  home = {
    username = "idoslonimsky";
    homeDirectory = "/home/idoslonimsky";
    stateVersion = "24.05";
    file = {
      ".zshenv".text = zshenv;
    };
    packages = [
      pkgs.cargo
      pkgs.cmatrix
      pkgs.fastfetch
      pkgs.go
      pkgs.lua51Packages.jsregexp
      pkgs.lua51Packages.lua
      pkgs.luarocks
      unstable.neovim
      pkgs.nodePackages.prettier
      pkgs.nodejs
      pkgs.xdg-ninja
    ];
  };

  imports = [
    ./modules/bundle.nix
  ];

  xdg.enable = true;

  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        v = "nvim";
      };
    };

    eza.enable = true;
    home-manager.enable = true;
  };
}
