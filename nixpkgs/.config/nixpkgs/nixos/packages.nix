{ pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    alacritty
    curl
    execline
    fd
    fzf
    gcc
    gettext
    git
    home-manager
    jq
    k3s
    k9s
    kubernetes-helm
    pwgen
    ripgrep
    slirp4netns
    stow
    unzip
    wget
    xclip
  ];

  # Install custom fonts.
  fonts.packages = [ (pkgs.nerdfonts.override { fonts = ["FiraCode"]; }) ];
}
