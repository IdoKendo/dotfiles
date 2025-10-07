{ pkgs, config, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../common/packages.nix
    ../common/kubernetes.nix
    ../common/fonts.nix
    ./packages.nix
  ];

  nix = {
    # Determinate uses its own daemon to manage the Nix installation that
    # conflicts with nix-darwin’s native Nix management.
    enable = false;
    settings = {
      # Enable flakes
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      # Comply with XDG specification.
      use-xdg-base-directories = true;
    };
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina

  # Enable touch ID to unlock sudo commands
  security.pam.services.sudo_local.touchIdAuth = true;
  # This also support touch ID in tmux to unlock sudo
  environment.etc."pam.d/sudo_local".text = ''
    # Managed by Nix Darwin
    auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
    auth       sufficient     pam_tid.so
  '';

  system.primaryUser = "idoslonimsky";

  # Greeting text on login window
  system.defaults.loginwindow.LoginwindowText = "Ido S.\nSenior Software Engineer";

  # Finder display settings
  system.defaults.finder = {
    AppleShowAllExtensions = true;
    AppleShowAllFiles = true;
    QuitMenuItem = true;
    _FXShowPosixPathInTitle = true;
  };

  # NSGlobalDomain settings
  system.defaults.NSGlobalDomain = {
    AppleShowAllExtensions = true;
    AppleShowAllFiles = true;
    InitialKeyRepeat = 25;
    KeyRepeat = 2;
    _HIHideMenuBar = true;
  };

  # dock settings
  system.defaults.dock = {
    autohide = true;
  };

  # Allow GUI applications to be found in spotlight
  system.activationScripts.applications.text =
    let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
    pkgs.lib.mkForce ''
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

  # MacOS specific apps - to be installed via homebrew
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
      "atlas"
      "postgresql@14"
      "sketchybar"
    ];
    casks = [
      "aerospace"
      "battery"
      "docker"
      "gimp"
      "keycastr"
      "obsidian"
      "vlc"
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
