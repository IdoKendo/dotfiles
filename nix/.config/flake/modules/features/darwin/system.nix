{ self, ... }:
{
  flake.modules.darwin."features-system-darwin" = {
    imports = [
      self.modules.darwin.nix-policy
      self.modules.darwin.local-authentication
      self.modules.darwin.desktop-preferences
      self.modules.darwin.application-integration
      self.modules.darwin.containers
    ];

    programs.zsh.enable = true;

    system.primaryUser = "idoslonimsky";

    system.stateVersion = 4;
    nixpkgs.hostPlatform = "aarch64-darwin";
  };
}
