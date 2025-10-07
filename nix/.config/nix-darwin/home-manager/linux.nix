{ ... }:
{
  home = {
    stateVersion = "24.11";
    username = "idoslonimsky";
    homeDirectory = "/home/idoslonimsky";
  };

  imports = [
    ../common/home.nix
  ];
}
