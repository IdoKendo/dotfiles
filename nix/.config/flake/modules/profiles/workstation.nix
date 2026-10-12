{ self, ... }:
{
  flake.modules.darwin.workstation = {
    imports = [
      self.modules.darwin."features-system-darwin"
      self.modules.darwin.fonts
      self.modules.darwin.terminal
      self.modules.darwin."features-packages-common"
      self.modules.darwin."features-packages-darwin"
    ];
  };

  flake.modules.darwin."features-system-darwin" = {
    imports = [
      self.modules.darwin.nix-policy
      self.modules.darwin.local-authentication
      self.modules.darwin.desktop-preferences
      self.modules.darwin.application-integration
      self.modules.darwin.containers
      self.modules.darwin.ido
    ];
  };
}
