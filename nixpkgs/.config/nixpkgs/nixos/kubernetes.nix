{ config, pkgs, meta, ... }:
{
  services.k3s = {
    enable = true;
    role = "server";
    # token = "supersecrettoken";
    tokenFile = "/var/lib/rancher/k3s/server/token";
    extraFlags = toString ([
      "--write-kubeconfig-mode \"0644\""
      "--cluster-init"
      "--disable servicelb"
      "--disable traefik"
      "--disable local-storage"
    ] ++ (if meta.hostname == "nixos" then [] else [
      "--server https://nixos:6443"
    ]));
    clusterInit = (meta.hostname == "nixos");
  };

}
