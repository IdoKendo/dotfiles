{ inputs, lib, ... }:
{
  flake.nixosModules."features-nixarr" = {
    imports = [
      inputs.nixarr.nixosModules.default
    ];

    nixarr = {
      enable = lib.mkDefault true;

      # Don't set this to /home/...
      mediaDir = "/media";
      stateDir = "/media/.state/nixarr";

      jellyfin = {
        enable = true;
        openFirewall = true;
      };
      transmission = {
        enable = true;
        openFirewall = true;
      };
      radarr = {
        enable = true;
        openFirewall = true;
      };
      sonarr = {
        enable = true;
        openFirewall = true;
      };
      bazarr = {
        enable = true;
        openFirewall = true;
      };
    };

    services.jackett = {
      # Indexer
      enable = true;
      dataDir = "/media/.state/jackett";
      group = "media";
      user = "jackett";
    };

    services.seerr = {
      # Discovery
      enable = true;
      openFirewall = true;
    };

    fileSystems."/mnt/media" = {
      device = "/dev/disk/by-uuid/417ae9a4-2849-4ef4-b013-a4ab24eee38d";
      fsType = "ext4";
      options = [ "defaults" "nofail" ];
    };
  };
}
