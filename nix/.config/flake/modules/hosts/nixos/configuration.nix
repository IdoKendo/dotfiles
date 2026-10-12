{ self, ... }:
{
  flake.modules.nixos.nixos =
    { ... }:
    {
      imports = [
        ./_hardware-configuration.nix
        self.modules.nixos.nix-policy
        self.modules.nixos.localization
        self.modules.nixos.always-on
        self.modules.nixos.printing
        self.modules.nixos.containers
        self.modules.nixos.fonts
        self.modules.nixos."features-packages-common"
        self.modules.nixos."features-packages-nixos"
        self.modules.nixos."features-nixarr"
        self.modules.nixos."features-nixos-bootloader"
        self.modules.nixos.gnome-desktop
        self.modules.nixos."features-nixos-networking"
        self.modules.nixos."features-nixos-sound"
        self.modules.nixos.ido
      ];

      networking.hostName = "nixos";

      services.tailscale.enable = true;

      system.stateVersion = "24.11";
    };
}
