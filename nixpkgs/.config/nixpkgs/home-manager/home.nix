{ config, pkgs, unstable, ... }:
{
  home = {
    username = "idoslonimsky";
    homeDirectory = "/home/idoslonimsky";
    stateVersion = "24.05";
    packages = [
      pkgs.cargo
      unstable.gitui
      pkgs.gcc
      pkgs.lua51Packages.jsregexp
      pkgs.lua51Packages.lua
      pkgs.luarocks
      unstable.neovim
      pkgs.nodePackages.prettier
      pkgs.nodejs
      unstable.typos-lsp
      unstable.uv
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
