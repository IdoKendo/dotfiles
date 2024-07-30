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
      pkgs.lua51Packages.jsregexp
      pkgs.lua51Packages.lua
      pkgs.luarocks
      pkgs.minikube
      pkgs.neovim
      pkgs.ripgrep
    ];
  };

  imports = [
    ./modules/bundle.nix
  ];

  xdg.enable = true;

  programs = {
    eza.enable = true;
    home-manager.enable = true;
  };
}
