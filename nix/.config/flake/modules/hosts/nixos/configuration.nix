{ self, ... }:
{
  flake.modules.nixos.nixos =
    { ... }:
    {
      imports = [
        self.modules.nixos.nixos-hardware
        self.modules.nixos.nix-policy
        self.modules.nixos.localization
        self.modules.nixos.always-on
        self.modules.nixos.printing
        self.modules.nixos.tailscale
        self.modules.nixos.containers
        self.modules.nixos.fonts
        self.modules.nixos.terminal
        self.modules.nixos.development
        self.modules.nixos.media-tools
        self.modules.nixos.documents
        self.modules.nixos.messaging
        self.modules.nixos.browser
        self.modules.nixos.cli-tools
        self.modules.nixos.clipboard
        self.modules.nixos."features-nixarr"
        self.modules.nixos."features-nixos-bootloader"
        self.modules.nixos.gnome-desktop
        self.modules.nixos."features-nixos-networking"
        self.modules.nixos."features-nixos-sound"
        self.modules.nixos.ido
      ];

      networking.hostName = "nixos";

      system.stateVersion = "24.11";
    };
}
