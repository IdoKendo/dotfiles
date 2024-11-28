{ ... }:
{
  nixarr = {
    enable = true;

    # Don't set this to /home/...
    mediaDir = "/run/media/idoslonimsky/417ae9a4-2849-4ef4-b013-a4ab24eee38d";
    stateDir = "/run/media/idoslonimsky/417ae9a4-2849-4ef4-b013-a4ab24eee38d/.state/nixarr";

    jellyfin.enable = true;     # Media Stream
    transmission.enable = true; # BitTorrent Client
    radarr.enable = true;       # Movies
    sonarr.enable = true;       # TV Shows
  };

  services.jackett = {  # Indexer
      enable = true;
      dataDir = "/run/media/idoslonimsky/417ae9a4-2849-4ef4-b013-a4ab24eee38d/.state/jackett";
      group = "media";
      user = "jackett";
  };

  services.jellyseerr = {  # Discovery
    enable = true;
    openFirewall = true;
  };
}
