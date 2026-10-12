{ self, ... }:
{
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
