{ self, ... }:
{
  flake.darwinModules.Idos-MacBook-Pro =
    { ... }:
    {
      imports = [
        self.darwinModules."features-system-darwin"
        self.darwinModules."features-desktop"
        self.darwinModules."features-packages-common"
        self.darwinModules."features-packages-darwin"
        self.darwinModules."features-kubernetes"
      ];
    };
}
