{ config, pkgs, meta, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
      ./docker.nix
      ./kubernetes.nix
      ./modules/bundle.nix
    ];

  nix.settings = {
    # Enable flakes
    experimental-features = ["nix-command" "flakes"];
    # Comply with XDG specification.
    use-xdg-base-directories = true;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Don't change this!
  system.stateVersion = "24.05";
}
