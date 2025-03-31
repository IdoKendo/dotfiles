{ pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    atuin
    aws-iam-authenticator
    basedpyright
    bash-language-server
    bat
    clang-tools
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
    gopls
    grpcurl
    gtypist
    gum
    helm-ls
    home-manager
    htmx-lsp
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
    lua-language-server
    lua51Packages.jsregexp
    lua51Packages.lua
    luarocks
    mkalias
    neovim
    nodePackages.prettier
    nodejs
    podman
    podman-compose
    podman-desktop
    pre-commit
    presenterm
    protobuf
    pwgen
    python313Packages.sqlfmt
    ripgrep
    ruff
    rust-analyzer
    silicon
    sqlc
    starship
    stern
    stow
    stylua
    terraform
    terraform-ls
    tmux
    typos-lsp
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
