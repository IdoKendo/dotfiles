{ self, ... }:
{
  flake.modules.generic.containers =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.podman ];
    };

  flake.modules.nixos.containers =
    { pkgs, ... }:
    {
      imports = [ self.modules.generic.containers ];
      environment.systemPackages = [ pkgs.slirp4netns ];
    };

  flake.modules.darwin.containers =
    { pkgs, lib, ... }:
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
      imports = [ self.modules.generic.containers ];

      launchd.user.agents.podman-machine = {
        serviceConfig = {
          ProgramArguments = [ "${podmanMachineStartup}" ];
          RunAtLoad = true;
          AbandonProcessGroup = true;
        };
      };
    };
}
