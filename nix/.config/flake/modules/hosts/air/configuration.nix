{ self, ... }:
{
  flake.modules.darwin.Idos-MacBook-Air =
    { ... }:
    {
      imports = [
        self.modules.darwin.workstation
      ];

      system.stateVersion = 4;
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
}
