{ ... }:
{
  flake.nixosModules."features-nixos-xserver" = {
    services.xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
