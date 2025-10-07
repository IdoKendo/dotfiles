{ lib, ... }:
{
  imports = [
    ./alacritty.nix
    ./atuin.nix
    ./ruff.nix
    ./starship.nix
  ];

  xdg.enable = true;
  alacritty.enable = lib.mkDefault true;
  atuin.enable = lib.mkDefault true;
  ruff.enable = lib.mkDefault true;
  starship.enable = lib.mkDefault true;

  programs = {
    eza.enable = true;
    home-manager.enable = true;
  };
}
