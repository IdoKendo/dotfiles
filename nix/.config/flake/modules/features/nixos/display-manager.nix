{ ... }:
{
  flake.nixosModules."features-nixos-display-manager" = {
    services.desktopManager.gnome.enable = true;

    services.displayManager = {
      gdm.enable = true;
      autoLogin.enable = true;
      autoLogin.user = "idoslonimsky";
    };
  };
}
