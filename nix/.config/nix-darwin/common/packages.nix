{ pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    atuin
    aws-iam-authenticator
    bat
    cmake
    cmatrix
    coreutils
    curl
    d2
    eksctl
    execline
    eza
    fastfetch
    fd
    fzf
    gettext
    git
    glab
    gnupg
    gnused
    gnutls
    go
    golangci-lint
    grpcurl
    gtypist
    gum
    home-manager
    hurl
    jq
    k9s
    kind
    kubebuilder
    kubecolor
    kubectl
    kubectx
    kubernetes-helm
    less
    lua51Packages.jsregexp
    lua51Packages.lua
    luarocks
    mkalias
    neovim
    nodejs
    podman
    podman-compose
    podman-desktop
    pre-commit
    presenterm
    protobuf
    pwgen
    ripgrep
    ruff
    silicon
    sqlc
    starship
    stern
    stow
    tmux
    unixtools.watch
    unzip
    uv
    wget
    xdg-ninja
    yq
  ];

  # Install custom fonts.
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}
