{ pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    aws-iam-authenticator
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
    grpcurl
    home-manager
    hurl
    jq
    k9s
    kubebuilder
    kubectl
    kubectx
    kubernetes-helm
    less
    lua51Packages.jsregexp
    lua51Packages.lua
    luarocks
    minikube
    neovim
    pwgen
    ripgrep
    silicon
    stow
    unzip
    wget
    xdg-ninja
  ];

  # Install custom fonts.
  fonts.packages = [ (pkgs.nerdfonts.override { fonts = ["FiraCode"]; }) ];
}
