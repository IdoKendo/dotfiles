{ self, ... }:
{
  flake.nixosHostModules.nixos =
    { ... }:
    {
      imports = [
        ./hardware-configuration.nix
        self.nixosModules."features-desktop"
        self.nixosModules."features-packages-common"
        self.nixosModules."features-packages-nixos"
        self.nixosModules."features-nixarr"
        self.nixosModules."features-nixos-bootloader"
        self.nixosModules."features-nixos-networking"
        self.nixosModules."features-nixos-sound"
        self.nixosModules."features-nixos-xserver"
        self.nixosModules."features-nixos-user"
      ];

      nixpkgs.config.allowUnfree = true;

      nix.settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        use-xdg-base-directories = true;
      };

      networking.hostName = "nixos";

      time.timeZone = "America/New_York";

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

      services.printing.enable = true;

      services.displayManager.autoLogin.enable = true;
      services.displayManager.autoLogin.user = "idoslonimsky";

      systemd.services."getty@tty1".enable = false;
      systemd.services."autovt@tty1".enable = false;

      systemd.sleep.extraConfig = ''
        AllowSuspend=no
        AllowHibernation=no
        AllowHybridSleep=no
        AllowSuspendThenHibernate=no
      '';

      system.stateVersion = "24.11";
    };
}
