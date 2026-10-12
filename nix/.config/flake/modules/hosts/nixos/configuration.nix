{ self, ... }:
{
  flake.modules.nixos.nixos =
    { ... }:
    {
      imports = [
        ./_hardware-configuration.nix
        self.modules.nixos."features-desktop"
        self.modules.nixos."features-packages-common"
        self.modules.nixos."features-packages-nixos"
        self.modules.nixos."features-nixarr"
        self.modules.nixos."features-nixos-bootloader"
        self.modules.nixos."features-nixos-display-manager"
        self.modules.nixos."features-nixos-networking"
        self.modules.nixos."features-nixos-sound"
        self.modules.nixos."features-nixos-xserver"
        self.modules.nixos."features-nixos-user"
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

      services.tailscale.enable = true;

      systemd.services."getty@tty1".enable = false;
      systemd.services."autovt@tty1".enable = false;

      systemd.sleep.settings.Sleep = {
        AllowSuspend = "no";
        AllowHibernation = "no";
        AllowHybridSleep = "no";
        AllowSuspendThenHibernate = "no";
      };

      system.stateVersion = "24.11";
    };
}
