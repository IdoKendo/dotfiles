{ ... }:
{
  nixarr = {
    enable = true;

    # Don't set this to /home/...
    mediaDir = "/run/media/idoslonimsky/021AA5051AA4F6B7";
    stateDir = "/run/media/idoslonimsky/021AA5051AA4F6B7/.state/nixarr";

    jellyfin.enable = true;     # Media Stream
    transmission.enable = true; # BitTorrent Client
    radarr.enable = true;       # Movies
    sonarr.enable = true;       # TV Shows
  };

  services.jackett = {  # Indexer
      enable = true;
      dataDir = "/run/media/idoslonimsky/021AA5051AA4F6B7/.state/jackett";
      group = "media";
      user = "jackett";
  };

  services.jellyseerr = {  # Discovery
    enable = true;
    openFirewall = true;
  };
}
