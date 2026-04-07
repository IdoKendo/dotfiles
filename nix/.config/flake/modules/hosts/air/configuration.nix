{ self, ... }:
{
  flake.darwinModules.Idos-MacBook-Air =
    { ... }:
    {
      imports = [
        self.darwinModules."features-system-darwin"
        self.darwinModules."features-desktop"
        self.darwinModules."features-packages-apps-overrides"
        self.darwinModules."features-packages-common"
        self.darwinModules."features-packages-darwin"
      ];
    };
}
