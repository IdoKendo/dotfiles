{ self, inputs, ... }:
{
  flake.darwinConfigurations.Idos-MacBook-Air = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      self.modules.darwin.Idos-MacBook-Air
      self.modules.darwin.homebrew
    ];
  };
}
