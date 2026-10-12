{ ... }:
{
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
