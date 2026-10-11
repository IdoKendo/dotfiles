{ self, ... }:
{
  flake.nixosConfigurations.nixos = self.inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosHostModules.nixos
    ];
  };
}
