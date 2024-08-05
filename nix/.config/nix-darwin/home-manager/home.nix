{ config, ... }: {
  home = {
    stateVersion = "23.11";
    username = "idoslonimsky";
    homeDirectory = "/Users/idoslonimsky";
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
