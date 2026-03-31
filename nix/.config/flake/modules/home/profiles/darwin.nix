{ self, ... }:
{
  flake.homeModules."home-profile-darwin" = {
    imports = [ self.homeModules."home-profile-common" ];

    home = {
      stateVersion = "24.11";
      username = "idoslonimsky";
      homeDirectory = "/Users/idoslonimsky";
    };
  };
}
