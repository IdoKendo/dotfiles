{ pkgs, ... }: {
  home = {
    stateVersion = "23.11";
    username = "idoslonimsky";
    homeDirectory = "/Users/idoslonimsky";
    packages = [
      pkgs.curl
      pkgs.fastfetch
      pkgs.fd
      pkgs.jq
      pkgs.k9s
      pkgs.kubebuilder
      pkgs.less
      pkgs.neovim
      pkgs.ripgrep
    ];
  };

  imports = [
    ./alacritty.nix
    ./ruff.nix
  ];

  home.sessionVariables = {
    PAGER   = "less";
    EDITOR  = "nvim";
  };

  xdg.enable = true;

  programs = {
    eza.enable = true;
    home-manager.enable = true;
  };
}
