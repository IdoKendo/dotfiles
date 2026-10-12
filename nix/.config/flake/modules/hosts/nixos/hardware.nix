{ ... }:
{
  flake.modules.nixos.nixos-hardware = {
    imports = [ ./_hardware-configuration.nix ];

    fileSystems."/mnt/media" = {
      device = "/dev/disk/by-uuid/417ae9a4-2849-4ef4-b013-a4ab24eee38d";
      fsType = "ext4";
      options = [ "defaults" "nofail" ];
    };
  };
}
