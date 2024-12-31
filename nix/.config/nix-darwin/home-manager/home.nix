{ ... }: {
  home = {
    stateVersion = "23.11";
    username = "idoslonimsky";
    homeDirectory = "/Users/idoslonimsky";
  };

  imports = [
    ../common/home.nix
  ];
}
