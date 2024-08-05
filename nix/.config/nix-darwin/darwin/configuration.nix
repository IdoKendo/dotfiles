{ pkgs, ... }: {
  imports =
    [
      ./packages.nix
    ];

  nix.settings = {
    # Enable flakes
    experimental-features = ["nix-command" "flakes"];
    # Comply with XDG specification.
    use-xdg-base-directories = true;
  };
  
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # Enable touch ID to unlock sudo commands
  security.pam.enableSudoTouchIdAuth = true;
  # This also support touch ID in tmux to unlock sudo
  environment.etc."pam.d/sudo_local".text = ''
    # Managed by Nix Darwin
    auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
    auth       sufficient     pam_tid.so
  '';

  # Greeting text on login window
  system.defaults.loginwindow.LoginwindowText = "Ido S.\nSenior Software Engineer";

  # Finder display settings
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.AppleShowAllFiles = true;
  system.defaults.finder._FXShowPosixPathInTitle = true;
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
  system.defaults.NSGlobalDomain.AppleShowAllFiles = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
