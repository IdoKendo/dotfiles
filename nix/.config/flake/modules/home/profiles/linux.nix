{ self, ... }:
{
  flake.homeModules."home-profile-linux" = {
    imports = [ self.homeModules."home-profile-common" ];

    home = {
      stateVersion = "24.11";
      username = "idoslonimsky";
      homeDirectory = "/home/idoslonimsky";
    };
  };
}
