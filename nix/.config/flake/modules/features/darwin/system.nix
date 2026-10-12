{ self, ... }:
{
  flake.modules.darwin."features-system-darwin" =
    {
      pkgs,
      lib,
      ...
    }:
    let
      podmanMachineStartup = pkgs.writeShellScript "start-podman-machine" ''
        set -eu

        podman=${lib.getExe pkgs.podman}
        machine=podman-machine-default

        if ! "$podman" machine inspect "$machine" >/dev/null 2>&1; then
          "$podman" machine init "$machine"
        fi

        "$podman" machine start "$machine"
      '';
    in
    {
      imports = [
        self.modules.darwin.nix-policy
        self.modules.darwin.local-authentication
        self.modules.darwin.desktop-preferences
        self.modules.darwin.application-integration
      ];

      programs.zsh.enable = true;

      launchd.user.agents.podman-machine = {
        serviceConfig = {
          ProgramArguments = [ "${podmanMachineStartup}" ];
          RunAtLoad = true;
          AbandonProcessGroup = true;
        };
      };

      system.primaryUser = "idoslonimsky";

      system.stateVersion = 4;
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
}
