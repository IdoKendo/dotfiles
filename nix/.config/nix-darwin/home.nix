{ pkgs, ... }: {
  home = {
    stateVersion = "23.11";
    username = "idoslonimsky";
    homeDirectory = "/Users/idoslonimsky";
    packages = [
      pkgs.cmatrix
      pkgs.curl
      pkgs.fastfetch
      pkgs.fd
      pkgs.jq
      pkgs.k9s
      pkgs.kubebuilder
      pkgs.kubernetes-helm
      pkgs.less
      pkgs.neovim
      pkgs.ripgrep
    ];
  };

  imports = [
    ./alacritty.nix
    ./ruff.nix
    ./starship.nix
  ];

  xdg.enable = true;

  programs = {
    atuin = {
      enable = true;
      settings = {
        keymap_mode = "vim-insert";
        enter_accept = true;
        history_filter = [
           "^v \.$"
           "^which "
        ];
      };
    };
    eza.enable = true;
    home-manager.enable = true;
  };
}
