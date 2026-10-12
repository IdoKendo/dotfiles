{ ... }:
{
  flake.modules.nixos."features-nixos-networking" = {
    networking.networkmanager.enable = true;
  };
}
