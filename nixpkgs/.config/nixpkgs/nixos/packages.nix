{ pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    alacritty
    bat
    curl
    execline
    fastfetch
    fd
    fzf
    gettext
    git
    home-manager
    jq
    k9s
    kubectl
    kubernetes-helm
    pwgen
    ripgrep
    slirp4netns
    stow
    unzip
    wget
    xclip
    xdg-ninja
  ];

  # Install custom fonts.
  fonts.packages = [ (pkgs.nerdfonts.override { fonts = ["FiraCode"]; }) ];
}
