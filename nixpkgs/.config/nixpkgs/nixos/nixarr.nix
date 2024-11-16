{ ... }:
{
  nixarr = {
    enable = true;

    # Don't set this to /home/...
    mediaDir = "/data/media";
    stateDir = "/data/media/.state/nixarr";

    jellyfin.enable = true;     # Media Stream
    transmission.enable = true; # BitTorrent Client
    radarr.enable = true;       # Movies
    sonarr.enable = true;       # TV Shows
  };

  services.jackett = {  # Indexer
      enable = true;
      dataDir = "/data/media/.state/jackett";
      group = "media";
      user = "jackett";
  };

  services.jellyseerr = {  # Discovery
    enable = true;
    openFirewall = true;
  };
}
