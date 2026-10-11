{ ... }:
{
  flake.nixosModules."features-nixos-networking" = {
    networking.networkmanager.enable = true;
  };
}
