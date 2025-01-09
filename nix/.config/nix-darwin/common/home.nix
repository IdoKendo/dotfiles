
{ ... }: {
  imports = [
    ./alacritty.nix
    ./atuin.nix
    ./ruff.nix
    ./starship.nix
  ];

  xdg.enable = true;

  programs = {
    eza.enable = true;
    home-manager.enable = true;
  };
}
