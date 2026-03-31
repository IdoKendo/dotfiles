{ ... }:
{
  flake.darwinModules."features-system-darwin" =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      nixpkgs.config.allowUnfree = true;

      nix = {
        enable = false;
        settings = {
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          use-xdg-base-directories = true;
        };
      };

      programs.zsh.enable = true;

      security.pam.services.sudo_local.touchIdAuth = true;
      environment.etc."pam.d/sudo_local".text = ''
        # Managed by Nix Darwin
        auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
        auth       sufficient     pam_tid.so
      '';

      system.primaryUser = "idoslonimsky";

      system.defaults.loginwindow.LoginwindowText = "Ido S.\nSenior Software Engineer";

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
          "FelixKratz/formulae"
          "nikitabobko/tap"
        ];
        brews = [
          "postgresql@16"
          "sketchybar"
        ];
        casks = [
          "aerospace"
          "battery"
          "docker-desktop"
          "gimp"
          "keycastr"
          "obsidian"
          "vlc"
        ];
      };

      system.stateVersion = 4;
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
}
