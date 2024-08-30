{ config, pkgs, ... }: {
  home = {
    stateVersion = "23.11";
    username = "idoslonimsky";
    homeDirectory = "/Users/idoslonimsky";
    packages = [
      pkgs.nixcasks.gimp
      pkgs.nixcasks.keycastr
    ];
  };

  imports = [
    ../common/alacritty.nix
    ../common/atuin.nix
    ../common/ruff.nix
    ../common/starship.nix
    ../common/tmux.nix
  ];

  xdg.enable = true;

  programs = {
    eza.enable = true;
    home-manager.enable = true;
  };
}
