{ self, ... }:
{
  flake.modules.darwin.workstation = {
    imports = [
      self.modules.darwin.workstation-base
      self.modules.darwin.fonts
      self.modules.darwin.terminal
      self.modules.darwin.development
      self.modules.darwin.media-tools
      self.modules.darwin.documents
      self.modules.darwin.messaging
      self.modules.darwin.cli-tools
      self.modules.darwin.window-management
    ];
  };

  flake.modules.darwin.workstation-base = {
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
