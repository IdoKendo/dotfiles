{
  description = "Ido's system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixarr = {
      url = "github:rasmus-kirk/nixarr";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew, nixarr }:
    let
      darwinArch = "aarch64-darwin";
      linuxArch = "x86_64-linux";

      darwinPkgs = nixpkgs.legacyPackages.${darwinArch};
      linuxPkgs = nixpkgs.legacyPackages.${linuxArch};

      nix-homebrew-config = {
        nix-homebrew = {
          enable = true;
          autoMigrate = true;
          # Apple Silicon Only
          enableRosetta = true;
          user = "idoslonimsky";
        };
      };

      macBookProModules = [
        ./darwin/pro.nix
        nix-homebrew.darwinModules.nix-homebrew
        nix-homebrew-config
      ];

      macBookAirModules = [
        ./darwin/air.nix
        nix-homebrew.darwinModules.nix-homebrew
        nix-homebrew-config
      ];

      mkDarwinSystem = modules: nix-darwin.lib.darwinSystem {
          system = darwinArch;
          modules = modules;
      };

      commonHomeModules = [ ./home-manager/home.nix ];

      mkHomeConfig = pkgs: hostname: home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = commonHomeModules;
       };
    in {
      legacyPackages.${darwinArch} = darwinPkgs;
      legacyPackages.${linuxArch} = linuxPkgs;

      # Build darwin flake using:
      # $ darwin-rebuild build --flake .
      darwinConfigurations = {
        "Idos-MacBook-Pro" = mkDarwinSystem macBookProModules;
        "Idos-MacBook-Air" = mkDarwinSystem macBookAirModules;
      };

      # Build nixos flake using:
      # $ nixos-rebuild build --flake .
      nixosConfigurations = {
        "nixos" = nixpkgs.lib.nixosSystem {
          system = linuxArch;
          specialArgs = { inherit inputs linuxPkgs; };
          modules = [
            ./nixos/hardware-configuration.nix
            ./nixos/configuration.nix
            nixarr.nixosModules.default
          ];
        };
      };

      # Build home-manager flake using:
      # $ home-manager build --flake .
      homeConfigurations = {
        "idoslonimsky@Idos-MacBook-Pro" = mkHomeConfig darwinPkgs "Idos-MacBook-Pro";
        "idoslonimsky@Idos-MacBook-Air" = mkHomeConfig darwinPkgs "Idos-MacBook-Air";
        "idoslonimsky@nixos"            = mkHomeConfig linuxPkgs "nixos";
      };
    };
}
