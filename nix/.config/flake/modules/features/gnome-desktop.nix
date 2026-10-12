{ ... }:
{
  flake.modules.nixos.gnome-desktop =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        gnomeExtensions.space-bar
        gnomeExtensions.switcher
        gnomeExtensions.tactile
        gnomeExtensions.just-perfection
      ];

      systemd.services."getty@tty1".enable = false;
      systemd.services."autovt@tty1".enable = false;

      services.desktopManager.gnome.enable = true;

      services.displayManager = {
        gdm.enable = true;
        autoLogin.enable = true;
        autoLogin.user = "idoslonimsky";
      };

      services.xserver = {
        enable = true;
        xkb = {
          layout = "us";
          variant = "";
        };
      };
    };
}
