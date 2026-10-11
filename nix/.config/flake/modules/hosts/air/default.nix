{ self, inputs, ... }:
{
  flake.darwinConfigurations.Idos-MacBook-Air = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      self.darwinModules.Idos-MacBook-Air
      inputs.nix-homebrew.darwinModules.nix-homebrew
      {
        nix-homebrew = {
          enable = true;
          autoMigrate = true;
          enableRosetta = true;
          user = "idoslonimsky";
        };
      }
    ];
  };
}
