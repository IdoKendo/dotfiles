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
    cmake
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
    home-manager
    hurl
    jq
    k9s
    kind
    kubebuilder
    kubectl
    kubectx
    kubernetes-helm
    less
    pwgen
    ripgrep
    slirp4netns
    silicon
    stow
    unzip
    wget
    xclip
    xdg-ninja
    yq
  ];

  # Install custom fonts.
  fonts.packages = [ (pkgs.nerdfonts.override { fonts = ["FiraCode"]; }) ];
}
