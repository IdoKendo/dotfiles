{ self, inputs, ... }:
{
  flake.darwinConfigurations.Idos-MacBook-Pro = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      self.modules.darwin.Idos-MacBook-Pro
      self.modules.darwin.homebrew
    ];
  };
}
