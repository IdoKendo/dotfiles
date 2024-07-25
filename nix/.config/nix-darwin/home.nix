{ pkgs, ... }: {
  home = {
    stateVersion = "23.11";
    username = "idoslonimsky";
    homeDirectory = "/Users/idoslonimsky";
    packages = [
      pkgs.aws-iam-authenticator
      pkgs.cmatrix
      pkgs.curl
      pkgs.eksctl
      pkgs.fastfetch
      pkgs.fd
      pkgs.fzf
      pkgs.hurl
      pkgs.jq
      pkgs.k9s
      pkgs.kubebuilder
      pkgs.kubectl
      pkgs.kubectx
      pkgs.kubernetes-helm
      pkgs.less
      pkgs.minikube
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
