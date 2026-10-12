{ inputs, lib, ... }:
{
  flake.modules.nixos.media-server =
    { pkgs, ... }:
    {
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
          package =
            (import inputs.nixarr.inputs.nixpkgs {
              system = pkgs.stdenv.hostPlatform.system;
            }).jellyfin;
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
        enable = true;
        dataDir = "/media/.state/jackett";
        group = "media";
        user = "jackett";
      };

      services.seerr = {
        enable = true;
        openFirewall = true;
      };
    };
}
