{ self, inputs, ... }:
{
  flake.darwinConfigurations.Idos-MacBook-Pro = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      self.darwinModules.Idos-MacBook-Pro
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
