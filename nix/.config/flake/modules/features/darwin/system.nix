{ self, ... }:
{
  flake.modules.darwin."features-system-darwin" =
    {
      pkgs,
      config,
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

      system.defaults.loginwindow.LoginwindowText = "Ido S.\nPrincipal Software Engineer";

      system.defaults.finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        QuitMenuItem = true;
        _FXShowPosixPathInTitle = true;
      };

      system.defaults.NSGlobalDomain = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        InitialKeyRepeat = 25;
        KeyRepeat = 2;
        _HIHideMenuBar = true;
      };

      system.defaults.dock.autohide = true;

      system.activationScripts.applications.text =
        let
          env = pkgs.buildEnv {
            name = "system-applications";
            paths = config.environment.systemPackages;
            pathsToLink = [ "/Applications" ];
          };
        in
        lib.mkForce ''
          # Set up applications.
          echo "setting up /Applications..." >&2
          rm -rf /Applications/Nix\ Apps
          mkdir -p /Applications/Nix\ Apps
          find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
          while read -r src; do
            app_name=$(basename "$src")
            echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
          done
        '';

      homebrew = {
        enable = true;
        onActivation = {
          cleanup = "zap";
          autoUpdate = false;
          upgrade = true;
        };
        taps = [
          {
            name = "FelixKratz/formulae";
            trusted = true;
          }
          {
            name = "nikitabobko/tap";
            trusted = true;
          }
        ];
        brews = [
          "postgresql@16"
          "FelixKratz/formulae/sketchybar"
        ];
        casks = [
          "codexbar"
          "gimp"
        ];
      };

      system.stateVersion = 4;
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
}
