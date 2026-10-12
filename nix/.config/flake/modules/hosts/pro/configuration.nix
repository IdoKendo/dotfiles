{ self, ... }:
{
  flake.modules.darwin.Idos-MacBook-Pro =
    { ... }:
    {
      imports = [
        self.modules.darwin."features-system-darwin"
        self.modules.darwin."features-desktop"
        self.modules.darwin."features-packages-common"
        self.modules.darwin."features-packages-darwin"
      ];
    };
}
