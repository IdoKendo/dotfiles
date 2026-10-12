{ self, ... }:
{
  flake.modules.darwin.Idos-MacBook-Air =
    { ... }:
    {
      imports = [
        self.modules.darwin."features-system-darwin"
        self.modules.darwin."features-desktop"
        self.modules.darwin."features-packages-common"
        self.modules.darwin."features-packages-darwin"
      ];

      system.stateVersion = 4;
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
}
