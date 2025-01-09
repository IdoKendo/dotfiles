{ pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    alacritty
    aws-iam-authenticator
    bat
    brave
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
    gnupg
    gnused
    gnutls
    go
    golangci-lint
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
    pwgen
    ripgrep
    slirp4netns
    silicon
    sqlc
    sqlite
    stow
    unzip
    uv
    wget
    xclip
    xdg-ninja
    yq
  ];

  # Install custom fonts.
  fonts.packages = [ (pkgs.nerdfonts.override { fonts = ["FiraCode"]; }) ];
}
