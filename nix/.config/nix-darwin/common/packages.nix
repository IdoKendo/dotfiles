{ pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    aws-iam-authenticator
    bat
    cmake
    cmatrix
    coreutils
    curl
    d2
    eksctl
    execline
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
    protobuf
    pwgen
    ripgrep
    silicon
    sqlc
    stow
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
