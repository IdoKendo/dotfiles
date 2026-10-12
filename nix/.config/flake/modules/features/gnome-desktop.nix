{ self, ... }:
{
  flake.modules.nixos.gnome-desktop =
    { pkgs, ... }:
    {
      imports = [
        self.modules.nixos."features-nixos-display-manager"
        self.modules.nixos."features-nixos-xserver"
      ];

      environment.systemPackages = with pkgs; [
        gnomeExtensions.space-bar
        gnomeExtensions.switcher
        gnomeExtensions.tactile
        gnomeExtensions.just-perfection
      ];

      systemd.services."getty@tty1".enable = false;
      systemd.services."autovt@tty1".enable = false;
    };

  flake.modules.nixos."features-nixos-display-manager" = {
    services.desktopManager.gnome.enable = true;

    services.displayManager = {
      gdm.enable = true;
      autoLogin.enable = true;
      autoLogin.user = "idoslonimsky";
    };
  };

  flake.modules.nixos."features-nixos-xserver" = {
    services.xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
