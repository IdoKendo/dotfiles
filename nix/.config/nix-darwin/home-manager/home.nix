{ ... }: {
  home = {
    stateVersion = "23.11";
    username = "idoslonimsky";
    homeDirectory = "/Users/idoslonimsky";
  };

  imports = [
    ../common/alacritty.nix
    ../common/atuin.nix
    ../common/ruff.nix
    ../common/starship.nix
  ];

  xdg.enable = true;

  programs = {
    eza.enable = true;
    home-manager.enable = true;
  };
}
